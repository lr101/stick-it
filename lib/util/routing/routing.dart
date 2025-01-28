
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_classes_with_only_static_members
class Routing {

  static Future<dynamic> to(BuildContext context, Widget to, [bool transition = true]) async {
    return await Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => to,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
    );
  }

  static Future<dynamic> toAndDelete(BuildContext context, Widget to, String routeName) async {
    return await Navigator.pushAndRemoveUntil(
      context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => to,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
        ModalRoute.withName(routeName),
    );
  }

  static Future<void> clickedOnLink(String? link) async {
    if (link != null) {
      try {
        await launchUrl(Uri.parse(link),
            mode: LaunchMode.externalApplication,);
      } catch (e) {
        CustomErrorSnackBar.message(message: "No app to open link found", type: CustomErrorSnackBarType.error);
      }
    }
  }

}
