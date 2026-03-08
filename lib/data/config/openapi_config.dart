import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'openapi_config.g.dart';
@Riverpod(keepAlive: true)
class OpenApiConfig extends _$OpenApiConfig {
  final HttpBearerAuth _authentication = HttpBearerAuth();
  
  // Using an empty string is generally safer than a mock string
  String _accessToken = ""; 
  
  // Mutex specifically for Auth so we don't spam the refresh endpoint
  final Mutex _authMutex = Mutex();
  DateTime? _lastCheck;

  @override
  ApiClient build() {
    final data = ref.watch(globalDataServiceProvider);
    
    _authentication.accessToken = () => _accessToken;
    final ApiClient apiClient = ApiClient(basePath: data.host, authentication: _authentication);

    final interceptorClient = _RateLimitedAuthClient(
      inner: http.Client(),
      ensureToken: _ensureTokenExists,
      getToken: () => _accessToken,
    );

    // 2. Wrap the custom client in the RetryClient to catch expired tokens
    apiClient.client = RetryClient(
      interceptorClient,
      delay: (_) => Duration.zero,
      retries: 1,
      when: (response) => response.statusCode == 403 || response.statusCode == 401,
      onRetry: (req, res, retryCount) async {
        if (retryCount == 0 && (res?.statusCode == 401 || res?.statusCode == 403)) {
          // Force a refresh when a 401 is encountered
          await provideAccessToken(force: true); 
          
          // Inject the newly fetched token into the retried request
          req.headers['Authorization'] = 'Bearer $_accessToken';
        }
      },
    );
    return apiClient;
  }

  /// Halts the HTTP pipeline to fetch a token if one does not exist
  Future<void> _ensureTokenExists() async {
    if (_accessToken.isEmpty || _accessToken == "NOTANACCESSTOKEN") {
      await provideAccessToken();
    }
  }

  Future<void> provideAccessToken({bool force = false}) async {
    await _authMutex.protect(() async {
      // Use ref.read() inside async callbacks to prevent the "Async Gap" crash!
      final data = ref.read(globalDataServiceProvider); 
      
      final needsRefresh = force || 
                           _lastCheck == null || 
                           DateTime.now().difference(_lastCheck!) > const Duration(minutes: 1);

      if (data.refreshToken != null && needsRefresh) {
        // Create a basic ApiClient here so AuthApi doesn't trigger our rate-limiter loop
        final authApi = AuthApi(ApiClient(basePath: data.host));
        final refreshTokenDto = RefreshTokenRequestDto(refreshToken: data.refreshToken, userId: data.userId);
        
        try {
          final response = await authApi.refreshToken(refreshTokenRequestDto: refreshTokenDto);
          if (response != null) {
            _accessToken = response.accessToken;
            _lastCheck = DateTime.now();
          } else {
            // TODO: Token is dead. Log the user out.
          }
        } catch (e) {
          // Handle network errors during refresh
        }
      }
    });
  }
}

class _CacheEntry {
  final Future<http.Response> responseFuture;
  final DateTime timestamp;

  _CacheEntry(this.responseFuture, this.timestamp);

  bool get isExpired => DateTime.now().difference(timestamp) > const Duration(minutes: 1);
}

/// Custom HTTP Client that forces single-file execution (CrowdSec fix),
/// verifies tokens BEFORE the request is sent, and deduplicates identical GET requests.
class _RateLimitedAuthClient extends http.BaseClient {
  final http.Client inner;
  final Future<void> Function() ensureToken;
  final String Function() getToken;
  
  // Mutex specifically for the request queue (Rate Limiting)
  final Mutex _requestMutex = Mutex();

  // Deduplicator Cache
  final Map<String, _CacheEntry> _cache = {};

  _RateLimitedAuthClient({
    required this.inner,
    required this.ensureToken,
    required this.getToken,
  });

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // 1. We ONLY want to deduplicate/cache GET requests. 
    // Caching POST/PUT/DELETE can lead to severe data integrity issues.
    if (request.method != 'GET') {
      return await _executeNetworkCall(request);
    }

    // 2. The URL contains both path and query parameters, making it a perfect cache key.
    final cacheKey = request.url.toString();

    // 3. Clean up expired entries to free memory
    _cache.removeWhere((key, entry) => entry.isExpired);

    // 4. CACHE HIT: Return the result of the already running (or completed) request
    if (_cache.containsKey(cacheKey)) {
      debugPrint("DEDUPLICATOR: Cache hit for $cacheKey");
      final cachedResponse = await _cache[cacheKey]!.responseFuture;
      return _toStreamedResponse(cachedResponse);
    }

    debugPrint("DEDUPLICATOR: Cache miss for $cacheKey, executing...");

    // 5. CACHE MISS: Create the Future that performs the request and reads it into memory.
    final responseFuture = _executeAndReadResponse(request);

    // 6. Instantly put the Future into the cache.
    // If another duplicate request fires 10ms from now, it will grab THIS future 
    // and wait for it to finish, rather than starting a new network call.
    _cache[cacheKey] = _CacheEntry(responseFuture, DateTime.now());

    try {
      final response = await responseFuture;
      return _toStreamedResponse(response);
    } catch (e) {
      // If the network call fails, wipe it from the cache so the next attempt can retry safely.
      _cache.remove(cacheKey);
      rethrow;
    }
  }

  /// Extracts the original Mutex/Auth logic into its own method
  Future<http.StreamedResponse> _executeNetworkCall(http.BaseRequest request) async {
    return await _requestMutex.protect(() async {
      await ensureToken();

      final currentToken = getToken();
      if (currentToken.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $currentToken';
      }

      debugPrint("---------------------->>>>>>> $request");
      final response = await inner.send(request);

      // Rate-limit delay (50ms) to bypass CrowdSec probing heuristics
      await Future.delayed(const Duration(milliseconds: 50));

      return response;
    });
  }

  /// Executes the request and buffers the body stream into memory so it can be shared
  Future<http.Response> _executeAndReadResponse(http.BaseRequest request) async {
    final streamedResponse = await _executeNetworkCall(request);
    return await http.Response.fromStream(streamedResponse);
  }

  /// Rebuilds a fresh StreamedResponse from the cached memory buffer
  http.StreamedResponse _toStreamedResponse(http.Response response) {
    return http.StreamedResponse(
      Stream.value(response.bodyBytes),
      response.statusCode,
      contentLength: response.bodyBytes.length,
      request: response.request,
      headers: response.headers,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
    );
  }
}

@Riverpod(keepAlive: true)
PinsApi pinApi(Ref ref) => PinsApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
GroupsApi groupApi(Ref ref) => GroupsApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
UsersApi userApi(Ref ref) => UsersApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
AuthApi authApi(Ref ref) => AuthApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
MembersApi memberApi(Ref ref) => MembersApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
ReportApi reportApi(Ref ref) => ReportApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
LikesApi likeApi(Ref ref) => LikesApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
RankingApi rankingApi(Ref ref) => RankingApi(ref.watch(openApiConfigProvider));
