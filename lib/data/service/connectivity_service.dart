
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/navigation/data/navigation_provider.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/group_dto.dart';

part 'connectivity_service.g.dart';

@Riverpod(keepAlive: true)
class ConnectivityService extends _$ConnectivityService {

  @override
  Stream<bool> build() {
    final connectivity = Connectivity();
    return connectivity.onConnectivityChanged.map((result) {
      final isOnline = result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
      if (isOnline) {
        CustomErrorSnackBar.message(message: "You are online again.", type: CustomErrorSnackBarType.success);
        ref.read(userGroupServiceProvider.notifier).sync().then((_) async {
          for (LocalGroupDto group in ref.read(userGroupServiceProvider).value ?? []) {
            await ref.read(pinServiceProvider(group.groupId).notifier).sync();
          }
        });
      } else {
        CustomErrorSnackBar.message(message: "No internet connection.", type: CustomErrorSnackBarType.error);
      }
      return isOnline;
    });
  }
}
