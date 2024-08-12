import 'dart:convert';

import 'package:buff_lisa/Files/Other/global.dart' as global;
import 'package:buff_lisa/Files/ServerCalls/fetch_users.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Secure {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  /// save a given value via a given key with the secure flutter storage package
  void saveSecure(
    String key,
    String value,
  ) {
    if (!kIsWeb) storage.write(key: key, value: value);
  }

  /// read a value via a given key from secure storage
  Future<String?> readSecure(String key) async {
    if (!kIsWeb) {
      return await storage.read(key: key);
    }
    return null;
  }

  /// remove a value via a given key from secure storage
  void removeSecure(String key) {
    if (!kIsWeb) storage.delete(key: key);
  }

}
