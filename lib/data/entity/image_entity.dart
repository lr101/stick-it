import 'dart:typed_data';

import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive/hive.dart';

part 'image_entity.g.dart'; // This will be generated

@HiveType(typeId: 2) // Unique type ID for this entity
class ImageEntity extends CacheEntity {
  @HiveField(3)
  final Uint8List? blob1; // Using List<int> to represent Blob


  ImageEntity({
    required this.blob1,
    super.keepAlive = false,
    super.hits,
    super.ttl,
  });

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return ImageEntity(
      blob1: blob1,
      keepAlive: keepAlive ?? this.keepAlive,
      hits: hits ?? this.hits,
      ttl: ttl ?? this.ttl,
    );
  }
}
