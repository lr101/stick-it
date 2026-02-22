
import 'package:buff_lisa/data/entity/user_pins_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_pins_repository.g.dart';

class UserPinsRepository extends CacheImpl<UserPinsEntity> {

  UserPinsRepository({required super.box, required super.isar}): super(ttlDuration: const Duration(minutes: 10));

}

@Riverpod(keepAlive: true)
UserPinsRepository userPinsRepository(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return UserPinsRepository(isar: isar, box: isar.userPinsEntitys);
} 
