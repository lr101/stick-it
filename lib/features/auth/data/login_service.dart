import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/presentation/loading.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:string_validator/string_validator.dart';
part 'login_service.g.dart';

class LoginService {
  Ref ref;

  LoginService({required this.ref});

  /// Navigates to the NavBar Widget when authentication was successful
  void handleLoginComplete(BuildContext context) {
    Routing.to(context, const Loading());
  }

  /// This method is called when the user tries to login with a username and password to an existing account
  /// return returns null when login was successful and an error message on errors
  Future<String?> authUser(LoginData data) async {
    try {
      final value = await ref.read(userServiceProvider.notifier).auth(data.name, data.password);
      return value ? null : 'Wrong username or password';
    } catch (e) {
      return "cannot connect to server";
    }
  }

  /// This method is called when a user completed the signup form and tries to signup
  /// return returns null when signup was successful and an error message on errors
  Future<String?> signupUser(SignupData data) async {
    try {
      if (data.name == null || data.password == null) {
        return Future<String>.value("name or password ar not valid");
      } else if (!emailValidator(data.additionalSignupData!["email"])) {
        return Future<String>.value("email does not have the correct format");
      } else {
        final value = await ref
            .read(userServiceProvider.notifier)
            .signupNewUser(data.name!, data.password!,
                data.additionalSignupData!["email"]!);
        return value ? null : 'Username already exists or check your internet';
      }
    } catch (e) {
      return "cannot connect to server";
    }
  }

  /// This method starts the recovery process for a given existing username
  /// Returns null on a successful call to the server or an error message on errors
  Future<String?> recoverPassword(String name) {
    try {
      return ref.read(userServiceProvider.notifier).recover(name).then((value) {
        return value ? null : 'User does not have an email address';
      });
    } catch (e) {
      return Future<String>.value("cannot connect to server");
    }
  }

  /// Validator Method for validating password
  /// returns null on success or an error message for an incorrect input
  static String? passwordValidator(String? s) {
    final alphanumeric =
        RegExp(r'^[a-zA-Z0-9!@#$%^&*(),.?":{}|<>~`/\\[\]\-_=+]*$');
    if (s == null) {
      return "input is not valid";
    } else if (s.length < 2) {
      return "at least 2 characters";
    } else if (s.length > 29) {
      return "shorter than 30 characters";
    } else if (!alphanumeric.hasMatch(s)) {
      return "includes not allowed characters";
    }
    return null;
  }

  /// Validator Method for validating password
  /// returns null on success or an error message for an incorrect input
  static String? userValidator(String? s) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9!@#$%^&*]*$');
    if (s == null) {
      return "input is not valid";
    } else if (s.length < 2) {
      return "at least 2 characters";
    } else if (s.length > 29) {
      return "shorter than 30 characters";
    } else if (!alphanumeric.hasMatch(s)) {
      return "includes not allowed characters";
    }
    return null;
  }

  /// Validator method for validating emails
  /// returns true on success or false for an incorrect input
  static bool emailValidator(String? s) {
    if (s != null && isEmail(s)) {
      return true;
    } else {
      return false;
    }
  }

  static String? emailValidatorWithErrorMessage(String? s) {
    if (s != null && isEmail(s)) {
      return null;
    } else {
      return "does not match email format";
    }
  }
}

@riverpod
LoginService loginService(LoginServiceRef ref) => LoginService(ref: ref);
