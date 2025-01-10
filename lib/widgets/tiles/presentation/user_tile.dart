import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../custom_interaction/presentation/custom_dialog.dart';
import '../../round_image/presentation/round_image.dart';

class UserTile extends ConsumerWidget {
  final String userId;

  UserTile({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userByIdUsernameProvider(userId));
    return ListTile(
      minTileHeight: 60,
          onTap: () => CustomDialog.show(context,
            acceptText: "Remove",
            title: "Remove hidden user",
            onPressed: () => ref.read(hiddenUserServiceProvider.notifier).removeHiddenUser(userId)),
          title: Align(alignment: Alignment.centerLeft, child: Text(user ?? "")),
          leading: RoundImage(
                imageCallback: ref.watch(userProfilePictureSmallByIdProvider(userId)),
                size: 25.0,
                child: Container()),
            );
  }
}
