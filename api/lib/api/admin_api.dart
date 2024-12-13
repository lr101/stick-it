//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AdminApi {
  AdminApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Send an admin mail
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AdminMailDto] adminMailDto:
  Future<Response> sendAdminMailWithHttpInfo({ AdminMailDto? adminMailDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v2/admin/mail';

    // ignore: prefer_final_locals
    Object? postBody = adminMailDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Send an admin mail
  ///
  /// Parameters:
  ///
  /// * [AdminMailDto] adminMailDto:
  Future<void> sendAdminMail({ AdminMailDto? adminMailDto, }) async {
    final response = await sendAdminMailWithHttpInfo( adminMailDto: adminMailDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
