
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:buff_lisa/data/entity/user_like_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository extends CacheImpl<UserEntity> {
  UserRepository({super.maxItems = 500, super.ttlDuration = const Duration(days: 1)}) : super("userRepository");
}

class UserLikeRepository extends CacheImpl<UserLikeEntity> {
  UserLikeRepository({super.maxItems = 50, super.ttlDuration = const Duration(days: 1)}) : super("userLikeRepo");
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) => UserRepository();

@Riverpod(keepAlive: true)
UserLikeRepository userLikeRepository(Ref ref) => UserLikeRepository();