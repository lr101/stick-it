
import 'package:buff_lisa/data/entity/user_pins_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_pins_repository.g.dart';

abstract class IUserPinsRepository implements CacheApi<UserPinsEntity>{}

class UserPinsRepository extends CacheImpl<UserPinsEntity> implements IUserPinsRepository {

  UserPinsRepository({required super.box, required super.isar}): super(ttlDuration: const Duration(minutes: 10));

}

class UserPinsRepositoryWeb extends InMemoryCache<UserPinsEntity> implements IUserPinsRepository {

  UserPinsRepositoryWeb(): super(ttlDuration: const Duration(minutes: 10));

}

@Riverpod(keepAlive: true)
IUserPinsRepository userPinsRepository(Ref ref) {
  if (kIsWeb) {
    return UserPinsRepositoryWeb();
  } else {
    final isar = ref.watch(isarRepoProvider);
    return UserPinsRepository(isar: isar, box: isar.userPinsEntitys);
  }
} 
