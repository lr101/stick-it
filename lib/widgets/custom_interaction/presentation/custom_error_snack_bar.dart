import 'package:buff_lisa/features/navigation/data/navigation_provider.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';

class CustomErrorSnackBar {
  static void message(
      {required String message,
      CustomErrorSnackBarType type = CustomErrorSnackBarType.info,}) {
    floatingSnackBar(
      message: message,
      context: navigatorKey.currentContext!,
      backgroundColor: type.color,
    );
  }
}

enum CustomErrorSnackBarType {
  success, error, warning, info;

  Color get color {
    switch (this) {
      case CustomErrorSnackBarType.success:
        return Colors.green;
      case CustomErrorSnackBarType.error:
        return Colors.red;
      case CustomErrorSnackBarType.warning:
        return Colors.orange;
      case CustomErrorSnackBarType.info:
        return Colors.blue;
    }
  }
}
