import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:openapi/api.dart';
import '../../Files/Other/global.dart' as global;

class OpenApiServices {

  late ApiClient _apiClient;
  final HttpBearerAuth _authentication = HttpBearerAuth();

  String accessToken = "NOT AN ACCESS TOKEN";

  OpenApiServices() {
    _authentication.accessToken = getToken;
    _apiClient = ApiClient(basePath: global.host, authentication: _authentication);

    // set retry client
    final httpClient = RetryClient(
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
    _apiClient.client = httpClient;
  }

  get pinApi => PinsApi(_apiClient);
  get groupApi => GroupsApi(_apiClient);
  get userApi => UsersApi(_apiClient);
  get authApi => AuthApi(_apiClient);
  get memberApi => MembersApi(_apiClient);
  get reportApi => ReportApi(_apiClient);

  Future<void> provideAccessToken() async {
    if (global.localData.token != null) {
      final authApi = AuthApi(ApiClient(basePath: global.host));
      final response = await authApi.refreshToken(body: global.localData.token);
      if (response != null) {
        accessToken = response.accessToken;
      } else {
        // TODO (logout or retry later)
      }
    }
  }

  String getToken() => accessToken;
}
