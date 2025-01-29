import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'no_user_group_service.g.dart';

@riverpod
class NoUserGroupService extends _$NoUserGroupService {


  @override
  Future<LocalGroupDto> build(String groupId) async {
    final noUserGroupRepo = ref.watch(noUserGroupRepositoryProvider);
    final groupEntity = await noUserGroupRepo.get(groupId);
    if (groupEntity != null) {
      return LocalGroupDto.fromEntityData(groupEntity);
    } else {
      final groupApi = ref.watch(groupApiProvider);
      final group = await groupApi.getGroup(groupId);
      await noUserGroupRepo.put(groupId, GroupEntity.fromGroupDto(group!));
      return LocalGroupDto.fromDto(group);
    }
  }
}
