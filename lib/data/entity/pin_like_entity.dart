
import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive/hive.dart';
import 'package:openapi/api.dart';

part 'pin_like_entity.g.dart';

@HiveType(typeId: 8)
class PinLikeEntity extends CacheEntity {

  @HiveField(3)
  final int likeCount;

  @HiveField(4)
  final int likePhotographyCount;

  @HiveField(5)
  final int likeLocationCount;

  @HiveField(6)
  final int likeArtCount;

  @HiveField(7)
  final bool hasLike;

  @HiveField(8)
  final bool hasLikePhotography;

  @HiveField(9)
  final bool hasLikeLocation;

  @HiveField(10)
  final bool hasLikeArt;

  PinLikeEntity({
    required this.likeCount,
    required this.likePhotographyCount,
    required this.likeLocationCount,
    required this.likeArtCount,
    required this.hasLikeArt,
    required this.hasLike,
    required this.hasLikeLocation,
    required this.hasLikePhotography,
    super.hits,
    super.ttl
  });

  factory PinLikeEntity.fromDto(PinLikeDto likes) {
    return PinLikeEntity(
      likeCount: likes.likeCount ?? 0,
      likePhotographyCount: likes.likePhotographyCount ?? 0,
      likeLocationCount: likes.likeLocationCount ?? 0,
      likeArtCount: likes.likeArtCount ?? 0,
      hasLike: likes.likedByUser ?? false,
      hasLikeLocation: likes.likedLocationByUser ?? false,
      hasLikeArt: likes.likedArtByUser ?? false,
      hasLikePhotography: likes.likedPhotographyByUser ?? false,
    );
  }


  PinLikeDto toDto() {
    return PinLikeDto(
      likeCount: likeCount,
      likePhotographyCount: likePhotographyCount,
      likeLocationCount: likeLocationCount,
      likeArtCount: likeArtCount,
      likedByUser: hasLike,
      likedPhotographyByUser: hasLikePhotography,
      likedLocationByUser: hasLikeLocation,
      likedArtByUser: hasLikeArt
    );
  }

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return PinLikeEntity(
      likeCount: likeCount,
      likePhotographyCount: likePhotographyCount,
      likeLocationCount: likeLocationCount,
      likeArtCount: likeArtCount,
      hasLike: hasLike,
      hasLikeLocation: hasLikeLocation,
      hasLikeArt: hasLikeArt,
      hasLikePhotography: hasLikePhotography,
      hits: hits ?? this.hits,
      ttl: ttl ?? this.ttl
    );
  }
  

}