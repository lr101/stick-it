# openapi.api.UsersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://app.lr-projects.de*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteUser**](UsersApi.md#deleteuser) | **DELETE** /api/v2/users/{userId} | Delete a user by userId
[**getUser**](UsersApi.md#getuser) | **GET** /api/v2/users/{userId} | Get a user by userId
[**getUserProfileImage**](UsersApi.md#getuserprofileimage) | **GET** /api/v2/users/{userId}/profile_picture | Get the profile picture of a user by userId
[**getUserProfileImageSmall**](UsersApi.md#getuserprofileimagesmall) | **GET** /api/v2/users/{userId}/profile_picture_small | Get the small profile picture of a user by userId
[**updateUser**](UsersApi.md#updateuser) | **PUT** /api/v2/users/{userId} | Update user information by userId
[**updateUserProfileImage**](UsersApi.md#updateuserprofileimage) | **PUT** /api/v2/users/{userId}/profile_picture | Update the profile picture of a user by userId


# **deleteUser**
> deleteUser(userId, body)

Delete a user by userId

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final body = int(); // int | 

try {
    api_instance.deleteUser(userId, body);
} catch (e) {
    print('Exception when calling UsersApi->deleteUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **body** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUser**
> UserInfoDto getUser(userId)

Get a user by userId

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getUser(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**UserInfoDto**](UserInfoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserProfileImage**
> String getUserProfileImage(userId)

Get the profile picture of a user by userId

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getUserProfileImage(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUserProfileImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/*, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserProfileImageSmall**
> String getUserProfileImageSmall(userId)

Get the small profile picture of a user by userId

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getUserProfileImageSmall(userId);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUserProfileImageSmall: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/*, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUser**
> TokenResponseDto updateUser(userId, userUpdateDto)

Update user information by userId

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final userUpdateDto = UserUpdateDto(); // UserUpdateDto | 

try {
    final result = api_instance.updateUser(userId, userUpdateDto);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->updateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **userUpdateDto** | [**UserUpdateDto**](UserUpdateDto.md)|  | 

### Return type

[**TokenResponseDto**](TokenResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserProfileImage**
> ProfileImageResponseDto updateUserProfileImage(userId, body)

Update the profile picture of a user by userId

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final body = String(); // String | 

try {
    final result = api_instance.updateUserProfileImage(userId, body);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->updateUserProfileImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **body** | **String**|  | 

### Return type

[**ProfileImageResponseDto**](ProfileImageResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: image/*
 - **Accept**: application/json, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

