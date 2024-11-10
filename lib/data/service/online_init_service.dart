
import 'package:buff_lisa/data/dto/online_login_dto.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_init_service.g.dart';

@Riverpod(keepAlive: true)
class OnlineInitService extends _$OnlineInitService {

  @override
  Future<bool> build() async {
    await ref.read(userGroupServiceProvider.notifier).sync();
    final groups = ref.read(userGroupServiceProvider).value!;
    for (var group in groups) {
      ref.read(pinServiceProvider(group.groupId).notifier).sync();
    }
    return true;
  }
}