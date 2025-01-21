
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/core/cache_impl.dart';

part 'group_repository.g.dart';

class GroupRepository extends CacheImpl<GroupEntity>{
  GroupRepository() : super("groupRepository");
}

class NoUserGroupRepository extends InMemoryCache<GroupEntity>{
  NoUserGroupRepository();
}

@Riverpod(keepAlive: true)
GroupRepository groupRepository(Ref ref) {
  return GroupRepository();
}

@Riverpod(keepAlive: true)
NoUserGroupRepository noUserGroupRepository(Ref ref) {
  return NoUserGroupRepository();
}
