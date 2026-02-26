import 'dart:io';

import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheMigrator {

  final SharedPreferences prefs;
  late final int version;
  final int latestVersion;

  CacheMigrator({required this.prefs, required this.latestVersion}) {
    version = prefs.getInt("hiveVersion") ?? 0;
  }

  Future<void> noDatabaseMigrate() async {
    for (int v = version + 1; v <= latestVersion; v++) {
      switch (v) {
        case 2: await _version2();
      }
      await prefs.setInt("hiveVersion", v);
    }
  }

  Future<void> migrate() async {
    for (int v = version + 1; v <= latestVersion; v++) {
      switch (v) {
        case 1: await _version1();
      }
      await prefs.setInt("hiveVersion", v);
    }
  }

  Future<void> _version1() async {
    debugPrint("This was previously a Hive migrator that is not needed anymore");
  }

  Future<void> _version2() async {
    // clearing existing database data
    await prefs.remove(GlobalDataRepository.lastSeenKey);
    if (!kIsWeb) {
      final dir =( await getApplicationDocumentsDirectory()).path;
      for (final file in Directory(dir).listSync()) {
        await file.delete(recursive: true);
      }

    }
  }

}
