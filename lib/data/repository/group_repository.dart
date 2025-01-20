
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/core/cache_impl.dart';

part 'group_repository.g.dart';

class GroupRepository extends CacheImpl<GroupEntity>{
  GroupRepository() : super("groupRepository");
}

@Riverpod(keepAlive: true)
GroupRepository groupRepository(Ref ref) {
  return GroupRepository();
}
