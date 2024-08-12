import 'dart:convert';
import 'dart:typed_data';
import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/DTOClasses/ranking.dart';
import 'package:buff_lisa/Files/Other/global.dart' as global;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:openapi/api.dart';

class FetchUsers {
  static final UsersApi _usersApi = global.openApiServices.userApi;
  static final AuthApi _authApi = global.openApiServices.authApi;
  static final MembersApi _membersApi = global.openApiServices.memberApi;
  static final ReportApi _reportApi = global.openApiServices.reportApi;

  static Future<List<Ranking>> fetchGroupMembers(Group group) async {
    final response = await _membersApi.getGroupRanking(group.groupId);
    if (response != null) {
      return response.map((dto) => Ranking.fromDto(dto)).toList();
    } else {
      throw Exception("Groups could not be loaded");
    }
  }

  static Future<String> getUsernameFromId(String userId) async {
    final response = await _usersApi.getUser(userId);
    if (response != null) {
      return response.username;
    } else {
      throw Exception("User could not be loaded");
    }
  }

  static Future<String?> checkUser(String? name) async {
    name ??= global.localData.username;
    try {
      final response = await _authApi.userLoginWithHttpInfo(UserLoginRequest(username: name, password: ""));
      if (response.statusCode == 404) {
        return "User not found";
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool> auth(String? name, String password) async {
    final request = UserLoginRequest(
      username: name,
      password: password,
    );
    try {
      final response = await _authApi.userLogin(request);
      if (response != null) {
        global.localData.login(name!, response.userId, response.refreshToken);
        return true;
      } else {
        return false;
      }


    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception("Login failed");
    }
    return false;
  }

  static Future<Uint8List> fetchProfilePicture(String userId) async {
    try {
      final response = await _usersApi.getUserProfileImageWithHttpInfo(userId);
      if (response.statusCode == 200 && response.bodyBytes.isNotEmpty) {
        return response.bodyBytes;
      } else {
        return (await rootBundle.load("images/profile.jpg")).buffer.asUint8List();
      }
    } catch (e) {
      throw Exception("Failed to load profile picture");
    }
  }

  static Future<Uint8List> fetchProfilePictureSmall(String username) async {
    try {
      final response = await _usersApi.getUserProfileImageSmallWithHttpInfo(username);
      if (response.statusCode == 200 || response.bodyBytes.isNotEmpty) {
        return response.bodyBytes;
      } else {
        return (await rootBundle.load("images/profile.jpg")).buffer.asUint8List();
      }
    } catch (e) {
      throw Exception("Failed to load profile picture");
    }
  }

  static Future<bool> recover(String? name) async {
    try {
      await _authApi.requestPasswordRecovery(name!);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> signupNewUser(String username, String hash, String email) async {
    final request = UserRequestDto(
      name: username,
      password: hash,
      email: email,
    );
    try {
      final response = await _authApi.createUser(request);
      return true;
    } catch (e) {
      return false;
    }
    return false;
  }

  static Future<bool> changePassword(String username, String password) async {
    final request = UserUpdateDto(
      password: password,
    );
    try {
      await _usersApi.updateUser(username, request);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> changeEmail(String username, String email) async {
    final request = UserUpdateDto(
      email: email,
    );
    try {
      await _usersApi.updateUser(username, request);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Uint8List?> changeProfilePicture(String username, Uint8List profilePicture) async {
    final imageBase64 = base64Encode(profilePicture);
    try {
      final response = await _usersApi.updateUserProfileImage(username, imageBase64);
      return response != null ? base64Decode(response.profilePicture) : null;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> postReportUser(String reportedUsername, String reportMessage) async {
    final request = ReportDto(
      report: reportedUsername,
      userId: global.localData.userId,
      message: reportMessage,
    );
    try {
      await _reportApi.createReport(request);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> getDeleteCode() async {
    try {
      await _authApi.generateDeleteCode(global.localData.userId);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteAccount(String code) async {
    try {
      await _usersApi.deleteUser(global.localData.userId, body: int.parse(code));
      return true;
    } catch (e) {
      return false;
    }
  }
}
