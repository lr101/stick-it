import 'dart:typed_data';

import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive/hive.dart';

part 'image_entity.g.dart'; // This will be generated

@HiveType(typeId: 2) // Unique type ID for this entity
class ImageEntity extends CacheEntity {
  @HiveField(3)
  final String filePath;


  ImageEntity({
    required this.filePath,
    super.keepAlive = false,
    super.hits,
    super.ttl,
  });

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return ImageEntity(
      filePath: filePath,
      keepAlive: keepAlive ?? this.keepAlive,
      hits: hits ?? this.hits,
      ttl: ttl ?? this.ttl,
    );
  }
}
