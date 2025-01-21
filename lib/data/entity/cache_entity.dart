
import 'package:hive/hive.dart';

abstract class CacheEntity {

  CacheEntity({this.keepAlive = false});

  @HiveField(0)
  final DateTime ttl = DateTime.now();

  @HiveField(1)
  final int hits = 1;

  @HiveField(2)
  final bool keepAlive;
}