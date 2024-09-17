import 'package:flutter/material.dart';

class CustomErrorSnackBar{

  static void message({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
}