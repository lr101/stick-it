# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://app.lr-projects.de*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUser**](AuthApi.md#createuser) | **POST** /api/v2/public/signup | User registration
[**generateDeleteCode**](AuthApi.md#generatedeletecode) | **GET** /api/v2/public/delete-code/{username} | Generate delete code
[**refreshToken**](AuthApi.md#refreshtoken) | **POST** /api/v2/public/refresh | Request a new access token
[**requestPasswordRecovery**](AuthApi.md#requestpasswordrecovery) | **GET** /api/v2/public/recover | Request password recovery
[**userLogin**](AuthApi.md#userlogin) | **POST** /api/v2/public/login | User login


# **createUser**
> TokenResponseDto createUser(userRequestDto)

User registration

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final userRequestDto = UserRequestDto(); // UserRequestDto | 

try {
    final result = api_instance.createUser(userRequestDto);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->createUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userRequestDto** | [**UserRequestDto**](UserRequestDto.md)|  | 

### Return type

[**TokenResponseDto**](TokenResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **generateDeleteCode**
> generateDeleteCode(username)

Generate delete code

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final username = username_example; // String | userId

try {
    api_instance.generateDeleteCode(username);
} catch (e) {
    print('Exception when calling AuthApi->generateDeleteCode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| userId | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshToken**
> TokenResponseDto refreshToken(body)

Request a new access token

Request a new access token with a refresh token

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final body = String(); // String | 

try {
    final result = api_instance.refreshToken(body);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->refreshToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **String**|  | [optional] 

### Return type

[**TokenResponseDto**](TokenResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestPasswordRecovery**
> requestPasswordRecovery(username)

Request password recovery

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final username = username_example; // String | 

try {
    api_instance.requestPasswordRecovery(username);
} catch (e) {
    print('Exception when calling AuthApi->requestPasswordRecovery: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userLogin**
> TokenResponseDto userLogin(userLoginRequest)

User login

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final userLoginRequest = UserLoginRequest(); // UserLoginRequest | 

try {
    final result = api_instance.userLogin(userLoginRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->userLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userLoginRequest** | [**UserLoginRequest**](UserLoginRequest.md)|  | 

### Return type

[**TokenResponseDto**](TokenResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, text/plain; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
