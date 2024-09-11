# openapi.api.PinsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://app.lr-projects.de*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPin**](PinsApi.md#createpin) | **POST** /api/v2/pins | Create a new pin
[**deletePin**](PinsApi.md#deletepin) | **DELETE** /api/v2/pins/{pinId} | Delete a pin by ID
[**getPin**](PinsApi.md#getpin) | **GET** /api/v2/pins/{pinId} | Get pin information by ID
[**getPinImage**](PinsApi.md#getpinimage) | **GET** /api/v2/pins/{pinId}/image | Get the image associated with a pin by ID
[**getPinImagesByIds**](PinsApi.md#getpinimagesbyids) | **GET** /api/v2/pins | Get images by IDs


# **createPin**
> PinWithoutImageDto createPin(pinRequestDto)

Create a new pin

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PinsApi();
final pinRequestDto = PinRequestDto(); // PinRequestDto | 

try {
    final result = api_instance.createPin(pinRequestDto);
    print(result);
} catch (e) {
    print('Exception when calling PinsApi->createPin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pinRequestDto** | [**PinRequestDto**](PinRequestDto.md)|  | 

### Return type

[**PinWithoutImageDto**](PinWithoutImageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePin**
> deletePin(pinId)

Delete a pin by ID

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PinsApi();
final pinId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api_instance.deletePin(pinId);
} catch (e) {
    print('Exception when calling PinsApi->deletePin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pinId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPin**
> PinWithoutImageDto getPin(pinId)

Get pin information by ID

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PinsApi();
final pinId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getPin(pinId);
    print(result);
} catch (e) {
    print('Exception when calling PinsApi->getPin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pinId** | **String**|  | 

### Return type

[**PinWithoutImageDto**](PinWithoutImageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPinImage**
> String getPinImage(pinId)

Get the image associated with a pin by ID

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PinsApi();
final pinId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getPinImage(pinId);
    print(result);
} catch (e) {
    print('Exception when calling PinsApi->getPinImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pinId** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/*, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPinImagesByIds**
> List<PinWithOptionalImageDto> getPinImagesByIds(ids, groupId, userId, withImage, compression, height, page, size)

Get images by IDs

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PinsApi();
final ids = []; // List<String> | Comma-separated list of image IDs
final groupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Only pins of this group are returned
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Only pins of this user are returned
final withImage = true; // bool | Describes if the images of the pins should be returned too
final compression = 56; // int | Compression level for images (optional)
final height = 56; // int | Height for images (optional)
final page = 56; // int | page number (can only be used when ids is not set). Sorted by creation date descending
final size = 56; // int | page size. Defaults to 20

try {
    final result = api_instance.getPinImagesByIds(ids, groupId, userId, withImage, compression, height, page, size);
    print(result);
} catch (e) {
    print('Exception when calling PinsApi->getPinImagesByIds: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**List<String>**](String.md)| Comma-separated list of image IDs | [optional] [default to const []]
 **groupId** | **String**| Only pins of this group are returned | [optional] 
 **userId** | **String**| Only pins of this user are returned | [optional] 
 **withImage** | **bool**| Describes if the images of the pins should be returned too | [optional] [default to false]
 **compression** | **int**| Compression level for images (optional) | [optional] 
 **height** | **int**| Height for images (optional) | [optional] 
 **page** | **int**| page number (can only be used when ids is not set). Sorted by creation date descending | [optional] 
 **size** | **int**| page size. Defaults to 20 | [optional] [default to 20]

### Return type

[**List<PinWithOptionalImageDto>**](PinWithOptionalImageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
