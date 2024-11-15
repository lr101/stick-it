import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'no_user_group_service.g.dart';

@Riverpod(keepAlive: true)
class NoUserGroupService extends _$NoUserGroupService {


  @override
  Future<LocalGroupDto> build(String groupId) async {
    final groupApi = ref.watch(groupApiProvider);
    final group = await groupApi.getGroup(groupId);
    if (group != null) {
      return LocalGroupDto.fromDto(group);
    } else {
      throw Exception("Group not found");
    }
  }
}