//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LikesApi {
  LikesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create or update a like
  ///
  /// Create or update a like
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] pinId (required):
  ///
  /// * [CreateLikeDto] createLikeDto (required):
  Future<Response> createOrUpdateLikeWithHttpInfo(String pinId, CreateLikeDto createLikeDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v2/likes/{pinId}'
      .replaceAll('{pinId}', pinId);

    // ignore: prefer_final_locals
    Object? postBody = createLikeDto;

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

  /// Create or update a like
  ///
  /// Create or update a like
  ///
  /// Parameters:
  ///
  /// * [String] pinId (required):
  ///
  /// * [CreateLikeDto] createLikeDto (required):
  Future<void> createOrUpdateLike(String pinId, CreateLikeDto createLikeDto,) async {
    final response = await createOrUpdateLikeWithHttpInfo(pinId, createLikeDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
