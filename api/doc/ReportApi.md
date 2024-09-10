# openapi.api.ReportApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://app.lr-projects.de*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createReport**](ReportApi.md#createreport) | **POST** /api/v2/report | Report content


# **createReport**
> createReport(reportDto)

Report content

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ReportApi();
final reportDto = ReportDto(); // ReportDto | 

try {
    api_instance.createReport(reportDto);
} catch (e) {
    print('Exception when calling ReportApi->createReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reportDto** | [**ReportDto**](ReportDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

