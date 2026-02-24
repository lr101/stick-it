
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_repository.g.dart';

class GroupRepository extends CacheImpl<GroupEntity>{

  GroupRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration});

  /// stream helpers, modelled after the pin repository pattern
  Stream<List<GroupEntity>> watchUserGroups() {
    return box.filter().userIsMemberEqualTo(true).build().watch(fireImmediately: true);
  }

  Stream<List<GroupEntity>> watchAllGroups() {
    return box.where().watch(fireImmediately: true);
  }
}

class NoUserGroupRepository extends InMemoryCache<GroupEntity>{
  NoUserGroupRepository();

}

@Riverpod(keepAlive: true)
GroupRepository groupRepository(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return GroupRepository(box: isar.groupEntitys, isar: isar);
}
