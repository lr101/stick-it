import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../custom_interaction/presentation/custom_dialog.dart';
import '../../round_image/presentation/round_image.dart';

class UserTile extends ConsumerWidget {
  final String userId;

  UserTile({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userByIdProvider(userId));
    return user.when(
        data: (data) => ListTile(
          onTap: () => CustomDialog.show(context,
            acceptText: "Remove",
            title: "Remove hidden user",
            onPressed: () => ref.read(hiddenUserServiceProvider.notifier).removeHiddenUser(userId)),
          title: Align(alignment: Alignment.centerLeft, child: Text(data.username)),
          leading: RoundImage(
                imageCallback: AsyncData(data.profileImageSmall),
                size: 20.0,
                child: Container()),
            ),
        error: (error, loading) => ListTile(title: Text("Ups, something went wrong")),
        loading: () => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: ListTile()));
  }
}
