import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'openapi_config.g.dart';

@Riverpod(keepAlive: true)
class OpenApiConfig extends _$OpenApiConfig {

  final HttpBearerAuth _authentication = HttpBearerAuth();

  String _accessToken = "NOTANACCESSTOKEN";

  Mutex _m = Mutex();

  DateTime? _lastCheck = null;

  @override
  ApiClient build() {
    final data = ref.watch(globalDataServiceProvider);
    _authentication.accessToken = getToken;
    ApiClient apiClient = ApiClient(basePath: data.host, authentication: _authentication);

    // set retry client
    apiClient.client = RetryClient(
      Client(),
      delay: (_) => const Duration(),
      retries: 1,
      when: (response) {
        return response.statusCode == 403 || response.statusCode == 401;
      },
      onRetry: (req, res, retryCount) async {
        if (retryCount == 0 && (res?.statusCode == 401 || res?.statusCode == 403)) {
          await provideAccessToken(); // get new access token after 401
          req.headers['Authorization'] = 'Bearer $_accessToken';
        }
      },
    );
    return apiClient;
  }

  Future<void> provideAccessToken() async {
    await _m.protect(() async {
      final data = ref.watch(globalDataServiceProvider);
      if (data.refreshToken != null && _lastCheck == null || DateTime.now().difference(_lastCheck!) > Duration(minutes: 1)) {
        final authApi = AuthApi(ApiClient(basePath: data.host));
        final refreshTokenDto = RefreshTokenRequestDto(refreshToken: data.refreshToken, userId: data.userId);
        final response = await authApi.refreshToken(refreshTokenRequestDto: refreshTokenDto);
        if (response != null) {
          _accessToken = response.accessToken;
          _lastCheck = DateTime.now();
        } else {
          // TODO (logout or retry later)
        }
      }}
    );
  }

  String getToken() => _accessToken;
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


