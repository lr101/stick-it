import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheMigrator {

  final SharedPreferences prefs;
  late final int version;
  final int latestVersion;

  CacheMigrator({required this.prefs, required this.latestVersion}) {
    version = prefs.getInt("hiveVersion") ?? 0;
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
    await Hive.deleteBoxFromDisk("groupProfileRepo");
    await Hive.deleteBoxFromDisk("groupProfileSmallRepo");
    await Hive.deleteBoxFromDisk("groupPinImageRepository");
    await Hive.deleteBoxFromDisk("userImageSmallRepository");
    await Hive.deleteBoxFromDisk("userImageRepository");
    await Hive.deleteBoxFromDisk("pinImages");
  }

}
