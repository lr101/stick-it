# openapi
No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.1
- Generator version: 7.9.0
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    path: /path/to/openapi
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/api.dart';

// TODO Configure HTTP Bearer authorization: token
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('token').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('token').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final adminMailDto = AdminMailDto(); // AdminMailDto | 

try {
    api_instance.sendAdminMail(adminMailDto);
} catch (e) {
    print('Exception when calling AdminApi->sendAdminMail: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *https://stick-it.lr-projects.de*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AdminApi* | [**sendAdminMail**](doc//AdminApi.md#sendadminmail) | **POST** /api/v2/admin/mail | Send an admin mail
*AuthApi* | [**createUser**](doc//AuthApi.md#createuser) | **POST** /api/v2/public/signup | User registration
*AuthApi* | [**generateDeleteCode**](doc//AuthApi.md#generatedeletecode) | **GET** /api/v2/public/delete-code/{username} | Generate delete code
*AuthApi* | [**getStatus**](doc//AuthApi.md#getstatus) | **GET** /api/v2/status | Gets the status of the server and user specific information
*AuthApi* | [**refreshToken**](doc//AuthApi.md#refreshtoken) | **POST** /api/v2/public/refresh | Request a new access token
*AuthApi* | [**requestPasswordRecovery**](doc//AuthApi.md#requestpasswordrecovery) | **GET** /api/v2/public/recover | Request password recovery
*AuthApi* | [**userLogin**](doc//AuthApi.md#userlogin) | **POST** /api/v2/public/login | User login
*GroupsApi* | [**addGroup**](doc//GroupsApi.md#addgroup) | **POST** /api/v2/groups | Create a new group
*GroupsApi* | [**deleteGroup**](doc//GroupsApi.md#deletegroup) | **DELETE** /api/v2/groups/{groupId} | Delete a group by ID
*GroupsApi* | [**getGroup**](doc//GroupsApi.md#getgroup) | **GET** /api/v2/groups/{groupId} | Get a group by ID
*GroupsApi* | [**getGroupAdmin**](doc//GroupsApi.md#getgroupadmin) | **GET** /api/v2/groups/{groupId}/admin | Get admin of group
*GroupsApi* | [**getGroupDescription**](doc//GroupsApi.md#getgroupdescription) | **GET** /api/v2/groups/{groupId}/description | Get description of group
*GroupsApi* | [**getGroupInviteUrl**](doc//GroupsApi.md#getgroupinviteurl) | **GET** /api/v2/groups/{groupId}/invite_url | Get invite url of group
*GroupsApi* | [**getGroupLink**](doc//GroupsApi.md#getgrouplink) | **GET** /api/v2/groups/{groupId}/link | Get link of group
*GroupsApi* | [**getGroupPinImage**](doc//GroupsApi.md#getgrouppinimage) | **GET** /api/v2/groups/{groupId}/pin_image | Get pin image of group
*GroupsApi* | [**getGroupProfileImage**](doc//GroupsApi.md#getgroupprofileimage) | **GET** /api/v2/groups/{groupId}/profile_image | Get profile of group
*GroupsApi* | [**getGroupProfileImageSmall**](doc//GroupsApi.md#getgroupprofileimagesmall) | **GET** /api/v2/groups/{groupId}/profile_image_small | Get small profile image url of group
*GroupsApi* | [**getGroupsByIds**](doc//GroupsApi.md#getgroupsbyids) | **GET** /api/v2/groups | Get groups by IDs
*GroupsApi* | [**updateGroup**](doc//GroupsApi.md#updategroup) | **PUT** /api/v2/groups/{groupId} | Update a group by ID
*LikesApi* | [**createOrUpdateLike**](doc//LikesApi.md#createorupdatelike) | **POST** /api/v2/pins/{pinId}/likes | Create or update a like
*LikesApi* | [**getPinLikes**](doc//LikesApi.md#getpinlikes) | **GET** /api/v2/pins/{pinId}/likes | Get pin likes
*LikesApi* | [**getUserLikes**](doc//LikesApi.md#getuserlikes) | **GET** /api/v2/users/{userId}/likes | Get user's likes
*MembersApi* | [**deleteMemberFromGroup**](doc//MembersApi.md#deletememberfromgroup) | **DELETE** /api/v2/groups/{groupId}/members | leave group or delete group when the user is the last group member
*MembersApi* | [**getGroupMembers**](doc//MembersApi.md#getgroupmembers) | **GET** /api/v2/groups/{groupId}/members | Get members of a group by ID
*MembersApi* | [**joinGroup**](doc//MembersApi.md#joingroup) | **POST** /api/v2/groups/{groupId}/members | Add a member to a group by ID
*PinsApi* | [**createPin**](doc//PinsApi.md#createpin) | **POST** /api/v2/pins | Create a new pin
*PinsApi* | [**deletePin**](doc//PinsApi.md#deletepin) | **DELETE** /api/v2/pins/{pinId} | Delete a pin by ID
*PinsApi* | [**getPin**](doc//PinsApi.md#getpin) | **GET** /api/v2/pins/{pinId} | Get pin information by ID
*PinsApi* | [**getPinImage**](doc//PinsApi.md#getpinimage) | **GET** /api/v2/pins/{pinId}/image | Get the image associated with a pin by ID
*PinsApi* | [**getPinImagesByIds**](doc//PinsApi.md#getpinimagesbyids) | **GET** /api/v2/pins | Get images by IDs
*PublicApi* | [**getServerInfo**](doc//PublicApi.md#getserverinfo) | **GET** /api/v2/public/infos | Get public server statistics
*RankingApi* | [**getGeoJson**](doc//RankingApi.md#getgeojson) | **GET** /api/v2/map/geojson | 
*RankingApi* | [**getMapInfo**](doc//RankingApi.md#getmapinfo) | **GET** /api/v2/map | 
*RankingApi* | [**groupRanking**](doc//RankingApi.md#groupranking) | **GET** /api/v2/ranking/group | 
*RankingApi* | [**searchRanking**](doc//RankingApi.md#searchranking) | **GET** /api/v2/ranking/search | Search for a location
*RankingApi* | [**userRanking**](doc//RankingApi.md#userranking) | **GET** /api/v2/ranking/user | 
*ReportApi* | [**createReport**](doc//ReportApi.md#createreport) | **POST** /api/v2/report | Report content
*UsersApi* | [**claimUserAchievement**](doc//UsersApi.md#claimuserachievement) | **POST** /api/v2/users/{userId}/achievements/{achievementId} | Claim an achievement
*UsersApi* | [**deleteUser**](doc//UsersApi.md#deleteuser) | **DELETE** /api/v2/users/{userId} | Delete a user by userId
*UsersApi* | [**getUser**](doc//UsersApi.md#getuser) | **GET** /api/v2/users/{userId} | Get a user by userId
*UsersApi* | [**getUserAchievements**](doc//UsersApi.md#getuserachievements) | **GET** /api/v2/users/{userId}/achievements | Get user's achievements
*UsersApi* | [**getUserProfileImage**](doc//UsersApi.md#getuserprofileimage) | **GET** /api/v2/users/{userId}/profile_picture | Get the profile picture of a user by userId
*UsersApi* | [**getUserProfileImageSmall**](doc//UsersApi.md#getuserprofileimagesmall) | **GET** /api/v2/users/{userId}/profile_picture_small | Get the small profile picture of a user by userId
*UsersApi* | [**getUserXp**](doc//UsersApi.md#getuserxp) | **GET** /api/v2/users/{userId}/xp | Get user's xp
*UsersApi* | [**updateUser**](doc//UsersApi.md#updateuser) | **PUT** /api/v2/users/{userId} | Update user information by userId


## Documentation For Models

 - [AdminMailDto](doc//AdminMailDto.md)
 - [CreateGroupDto](doc//CreateGroupDto.md)
 - [CreateLikeDto](doc//CreateLikeDto.md)
 - [GroupDto](doc//GroupDto.md)
 - [GroupRankingDtoInner](doc//GroupRankingDtoInner.md)
 - [GroupsSyncDto](doc//GroupsSyncDto.md)
 - [InfoDto](doc//InfoDto.md)
 - [MapInfoDto](doc//MapInfoDto.md)
 - [MemberResponseDto](doc//MemberResponseDto.md)
 - [PinLikeDto](doc//PinLikeDto.md)
 - [PinRequestDto](doc//PinRequestDto.md)
 - [PinWithOptionalImageDto](doc//PinWithOptionalImageDto.md)
 - [PinsSyncDto](doc//PinsSyncDto.md)
 - [RankingSearchDtoInner](doc//RankingSearchDtoInner.md)
 - [RefreshTokenRequestDto](doc//RefreshTokenRequestDto.md)
 - [ReportDto](doc//ReportDto.md)
 - [SeasonDto](doc//SeasonDto.md)
 - [SeasonItemDto](doc//SeasonItemDto.md)
 - [Status](doc//Status.md)
 - [TokenResponseDto](doc//TokenResponseDto.md)
 - [UpdateGroupDto](doc//UpdateGroupDto.md)
 - [UserAchievementsDtoInner](doc//UserAchievementsDtoInner.md)
 - [UserInfoDto](doc//UserInfoDto.md)
 - [UserLikesDto](doc//UserLikesDto.md)
 - [UserLoginRequest](doc//UserLoginRequest.md)
 - [UserRankingDtoInner](doc//UserRankingDtoInner.md)
 - [UserRequestDto](doc//UserRequestDto.md)
 - [UserUpdateDto](doc//UserUpdateDto.md)
 - [UserUpdateResponseDto](doc//UserUpdateResponseDto.md)
 - [UserXpDto](doc//UserXpDto.md)


## Documentation For Authorization


Authentication schemes defined for the API:
### token

- **Type**: HTTP Bearer authentication


## Author



