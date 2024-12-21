
import 'package:buff_lisa/features/profile/presentation/other_user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/global_data_service.dart';
import '../../../util/routing/routing.dart';

class ClickableUser extends ConsumerWidget {

  final String userId;
  final Widget child;

  const ClickableUser({super.key, required this.userId, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCurrentUser = ref.watch(globalDataServiceProvider.select((e) => e.userId == userId));
    return GestureDetector(
      onTap: () => isCurrentUser ? null : Routing.to(context, OtherUserProfile(userId: userId)),
      child: child,
    );
  }

}