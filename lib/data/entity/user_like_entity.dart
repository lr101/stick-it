
import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive/hive.dart';
import 'package:openapi/api.dart';

part 'user_like_entity.g.dart';

@HiveType(typeId: 7)
class UserLikeEntity extends CacheEntity {

  @HiveField(3)
  final int likeCount;

  @HiveField(4)
  final int likePhotographyCount;

  @HiveField(5)
  final int likeLocationCount;

  @HiveField(6)
  final int likeArtCount;

  UserLikeEntity({
    required this.likeCount,
    required this.likePhotographyCount,
    required this.likeLocationCount,
    required this.likeArtCount,
    super.hits,
    super.ttl
  });

  factory UserLikeEntity.fromDto(UserLikesDto likes) {
    return UserLikeEntity(
        likeCount: likes.likeCount,
        likePhotographyCount: likes.likePhotographyCount,
        likeLocationCount: likes.likeLocationCount,
        likeArtCount: likes.likeArtCount
    );
  }

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return UserLikeEntity(
      likeCount: likeCount,
      likePhotographyCount: likePhotographyCount,
      likeLocationCount: likeLocationCount,
      likeArtCount: likeArtCount,
      hits: hits ?? this.hits,
      ttl: ttl ?? this.ttl
    );
  }

}