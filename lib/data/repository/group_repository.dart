
import 'dart:async';

import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_repository.g.dart';



abstract class IGroupRepository implements CacheApi<GroupEntity> {
  Stream<List<GroupEntity>> watchUserGroups();
  Stream<List<GroupEntity>> watchAllGroups();
}

class GroupRepository extends CacheImpl<GroupEntity> implements IGroupRepository {

  GroupRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration});

  @override
  Stream<List<GroupEntity>> watchUserGroups() {
    return box.filter().userIsMemberEqualTo(true).build().watch(fireImmediately: true);
  }

  @override
  Stream<List<GroupEntity>> watchAllGroups() {
    return box.where().watch(fireImmediately: true);
  }
}

class GroupRepositoryWeb extends InMemoryCache<GroupEntity> implements IGroupRepository {
  
  GroupRepositoryWeb();

 @override
  Stream<List<GroupEntity>> watchUserGroups() {
    return cacheChanges.map((g) => g.values.where((g) => g.userIsMember == true).toList());
  }

  @override
  Stream<List<GroupEntity>> watchAllGroups()  {
    return cacheChanges.map((e) => e.values.toList());
  }
}


@Riverpod(keepAlive: true)
IGroupRepository groupRepository(Ref ref) {
  if (kIsWeb) {
    return GroupRepositoryWeb();
  } else {
    final isar = ref.watch(isarRepoProvider);
    return GroupRepository(box: isar.groupEntitys, isar: isar);
  }
}
