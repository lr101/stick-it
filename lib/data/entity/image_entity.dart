import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'image_entity.g.dart';

@HiveType(typeId: 2)
class ImageEntity extends CacheEntity {
  @HiveField(3)
  final String filePath;

  @HiveField(4)
  final bool isEmpty;


  ImageEntity({
    required this.filePath,
    this.isEmpty = false,
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
