import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'openapi_config.g.dart';

@Riverpod(keepAlive: true)
class OpenApiConfig extends _$OpenApiConfig {

  final HttpBearerAuth _authentication = HttpBearerAuth();

  String accessToken = "NOTANACCESSTOKEN";

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
          req.headers['Authorization'] = 'Bearer $accessToken';
        }
      },
    );
    return apiClient;
  }

  Future<void> provideAccessToken() async {
    final data = ref.watch(globalDataServiceProvider);
    if (data.refreshToken != null) {
      final authApi = AuthApi(ApiClient(basePath: data.host));
      final response = await authApi.refreshToken(body: data.refreshToken);
      if (response != null) {
        accessToken = response.accessToken;
      } else {
        // TODO (logout or retry later)
      }
    }
  }

  String getToken() => accessToken;
}

@Riverpod(keepAlive: true)
PinsApi pinApi(PinApiRef ref) => PinsApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
GroupsApi groupApi(GroupApiRef ref) => GroupsApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
UsersApi userApi(UserApiRef ref) => UsersApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
AuthApi authApi(AuthApiRef ref) => AuthApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
MembersApi memberApi(MemberApiRef ref) => MembersApi(ref.watch(openApiConfigProvider));

@Riverpod(keepAlive: true)
ReportApi reportApi(ReportApiRef ref) => ReportApi(ref.watch(openApiConfigProvider));

