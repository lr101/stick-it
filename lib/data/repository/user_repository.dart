
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:buff_lisa/data/entity/user_like_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

abstract class IUserRepository implements CacheApi<UserEntity>{}
abstract class IUserLikeRepository implements CacheApi<UserLikeEntity>{}


class UserRepository extends CacheImpl<UserEntity> implements IUserRepository {
  UserRepository({required super.box, required super.isar, super.maxItems = 500, super.ttlDuration = const Duration(days: 1)});
}

class UserRepositoryWeb extends InMemoryCache<UserEntity> implements IUserRepository {
  UserRepositoryWeb({super.maxItems = 500, super.ttlDuration = const Duration(days: 1)});
}

class UserLikeRepository extends CacheImpl<UserLikeEntity> implements IUserLikeRepository{
  UserLikeRepository({required super.box, required super.isar, super.maxItems = 50, super.ttlDuration = const Duration(days: 1)});
}

class UserLikeRepositoryWeb extends InMemoryCache<UserLikeEntity> implements IUserLikeRepository {
  UserLikeRepositoryWeb({super.maxItems = 50, super.ttlDuration = const Duration(days: 1)});
}

@Riverpod(keepAlive: true)
IUserRepository userRepository(Ref ref) {
  if (kIsWeb) return UserRepositoryWeb();
  final isar = ref.watch(isarRepoProvider);
  return UserRepository(isar: isar, box: isar.userEntitys); 
}

@Riverpod(keepAlive: true)
IUserLikeRepository userLikeRepository(Ref ref) {
  if (kIsWeb) return UserLikeRepositoryWeb();
  final isar = ref.watch(isarRepoProvider);
  return UserLikeRepository(isar: isar, box: isar.userLikeEntitys);
}
