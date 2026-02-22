
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:buff_lisa/data/entity/user_like_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository extends CacheImpl<UserEntity> {
  UserRepository({required super.box, required super.isar, super.maxItems = 500, super.ttlDuration = const Duration(days: 1)});
}

class UserLikeRepository extends CacheImpl<UserLikeEntity> {
  UserLikeRepository({required super.box, required super.isar, super.maxItems = 50, super.ttlDuration = const Duration(days: 1)});
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return UserRepository(isar: isar, box: isar.userEntitys); 
}

@Riverpod(keepAlive: true)
UserLikeRepository userLikeRepository(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return UserLikeRepository(isar: isar, box: isar.userLikeEntitys);
}
