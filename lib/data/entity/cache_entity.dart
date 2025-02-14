
import 'package:hive_ce_flutter/adapters.dart';

abstract class CacheEntity {

  CacheEntity({this.keepAlive = false, this.hits = 1, DateTime? ttl}) {
    this.ttl = ttl ?? DateTime.now();
  }

  @HiveField(0)
  late final DateTime ttl;

  @HiveField(1)
  final int hits;

  @HiveField(2)
  final bool keepAlive;

  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive});
}
