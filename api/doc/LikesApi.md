# openapi.api.LikesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://app.lr-projects.de*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrUpdateLike**](LikesApi.md#createorupdatelike) | **POST** /api/v2/likes/{pinId} | Create or update a like


# **createOrUpdateLike**
> createOrUpdateLike(pinId, createLikeDto)

Create or update a like

Create or update a like

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = LikesApi();
final pinId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final createLikeDto = CreateLikeDto(); // CreateLikeDto | 

try {
    api_instance.createOrUpdateLike(pinId, createLikeDto);
} catch (e) {
    print('Exception when calling LikesApi->createOrUpdateLike: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pinId** | **String**|  | 
 **createLikeDto** | [**CreateLikeDto**](CreateLikeDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

