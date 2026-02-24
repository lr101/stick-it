import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:isar_community/isar.dart';

part 'image_entity.g.dart';

// 1. Define your entity types
enum ImageType {
  pin,
  user,
  userSmall,
  group,
  groupSmall,
  groupPin
}

@collection
class ImageEntity extends CacheEntity {
  @override
  Id get isarId => fastHash('${type.name}_$id');

  final String id;
  
  @Index()
  @enumerated
  final ImageType type;
  
  final String filePath;
  final bool isEmpty;

  ImageEntity({
    required this.id,
    required this.type, // Require the type in the constructor
    required this.filePath,
    this.isEmpty = false,
    super.keepAlive = false,
    super.hits,
    required super.ttl,
    required super.onlySession
  });

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive, bool? onlySession}) {
    return ImageEntity(
      id: id,
      type: type, // Ensure type is preserved on copy
      filePath: filePath,
      keepAlive: keepAlive ?? this.keepAlive,
      hits: hits ?? this.hits,
      ttl: ttl ?? this.ttl,
      onlySession: onlySession ?? this.onlySession
    );
  }
}
