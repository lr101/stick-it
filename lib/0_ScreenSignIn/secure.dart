
import 'dart:convert';

import 'package:crypt/crypt.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:buff_lisa/Files/ServerCalls/fetch_users.dart';
import 'package:buff_lisa/Files/Other/global.dart' as global;

class Secure {

  /// save a given value via a given key with the secure flutter storage package
  static void saveSecure(String value, String key) {
    if (!kIsWeb)  const FlutterSecureStorage().write(key: key, value: value);
  }

  /// read a value via a given key from secure storage
  static Future<String?> readSecure(String key) async {
    if (!kIsWeb) {
      return await const FlutterSecureStorage().read(key: key);
    }
    return null;
  }

  /// remove a value via a given key from secure storage
  static void removeSecure(String key) {
    if (!kIsWeb) const FlutterSecureStorage().delete(key: key);
  }

  /// loading username and token to check if user is already logged in on this device
  /// -> if logged in then the username and token are saved in global file and true is returned
  static Future<bool> tryLocalLogin() async {
    if (kIsWeb) return false;
    const storage = FlutterSecureStorage();
    String? storedUsername = await storage.read(key: "username");
    String? storedToken = await storage.read(key: "auth");
    if (storedUsername != null && storedToken != null) {
      global.username = storedUsername;
      global.token = storedToken;
      return true;
    }
    return false;
  }

  /// encrypt a given string with the sh256 encryption package
  static String encryptPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  /// signup with a given username, password and email
  /// saves on successful account creation the username and token in secure storage and returns true
  static Future<bool> signupAuthentication(String username, String password, String email) async {
    String psw = Secure.encryptPassword(password);
    return saveToken(tokenFunction: () =>  FetchUsers.signupNewUser(username, psw, email), username: username);
  }

  /// signin process sends encoded password to server and obtains a JWT token on success
  /// saves after successful login username and token in secure storage and returns true
  static Future<bool> loginAuthentication(String username, String password,) async {
    return saveToken(tokenFunction: () => FetchUsers.auth(username, encryptPassword(password)), username: username);
  }

  /// saves for a given function, that returns the token and a username
  /// in a secure storage and in the global file for use in current session
  static Future<bool> saveToken({required Future<String?> Function() tokenFunction, required String username}) async {
    String? token = await tokenFunction();
    if (token != null) {
      saveSecure(username, "username");
      saveSecure(token, "auth");
      global.token = token;
      global.username = username;
      return true;
    } else {
      return false;
    }
  }
}