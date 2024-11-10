
import 'package:buff_lisa/features/profile/presentation/other_user_profile.dart';
import 'package:flutter/cupertino.dart';

import '../../../util/routing/routing.dart';

class ClickableUser extends StatelessWidget {

  final String userId;
  final String username;
  final TextStyle? textStyle;

  const ClickableUser({super.key, required this.userId, required this.username, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routing.to(context, OtherUserProfile(userId: userId)),
      child: Text(username, style: textStyle,),
    );
  }

}