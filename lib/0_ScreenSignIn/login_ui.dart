import 'package:buff_lisa/0_ScreenSignIn/login_logic.dart';
import 'package:buff_lisa/Files/AbstractClasses/abstract_widget_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../Files/Other/global.dart' as global;
import '../7_Settings/WebView/show_web_widget.dart';
import '../Files/Routes/routing.dart';
import '../Files/Themes/custom_theme.dart';

class LoginUI extends StatelessUI<LoginScreen> {
  const LoginUI({super.key, required widget}) : super(widget: widget);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Stick-It',
      theme: LoginTheme(
        pageColorDark: CustomTheme.c1,
        pageColorLight: CustomTheme.c1,
        primaryColor: CustomTheme.c1,
      ),
      termsOfService: [
        TermOfService(id: "0", text: "Terms of Service", mandatory: true, linkUrl: "https://${global.host}/public/agb"),
        TermOfService(id: "1", text: "Privacy Policy", mandatory: true, linkUrl: "https://${global.host}/public/privacy-policy")
      ],
      onLogin: widget.authUser,
      onSignup: widget.signupUser,
      userType: LoginUserType.name,
      passwordValidator: LoginScreen.passwordValidator,
      userValidator: LoginScreen.userValidator,
      onSubmitAnimationCompleted: () => widget.handleLoginComplete(context),
      validateUserImmediately: true,
      onRecoverPassword: widget.recoverPassword,
      messages: LoginMessages(
          recoverPasswordDescription: "Type your username here and than check your emails",
          recoverPasswordSuccess: "Check your emails for a recovery link"
      ),
      additionalSignupFields: const [UserFormField(keyName: "email", userType: LoginUserType.email)],
      children: [ Positioned.fill(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: privacyPolicyLinkAndTermsOfService(context),
              )
          )
      ),],
    );
  }

  /// creates the text, that is shown at the bottom of the login screen
  /// 'Terms of Service' and 'Privacy Policy' are clickable
  /// Click opens the corresponding page of the [ShowWebWidget]
  Widget privacyPolicyLinkAndTermsOfService(BuildContext context) {
    return Text.rich(
        TextSpan(
            text: 'By continuing, you agree to our ', style: const TextStyle(
            fontSize: 16,
        ),
            children: <TextSpan>[
              TextSpan(
                  text: 'Terms of Service', style: const TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Routing.to(context, ShowWebWidget(route: "https://${global.host}/public/agb",title: "Terms of Service",));
                    }
              ),
              TextSpan(
                  text: ' and ', style: const TextStyle(
                  fontSize: 18,
              ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Privacy Policy', style: const TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline
                    ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Routing.to(context, ShowWebWidget(route: "https://${global.host}/public/privacy-policy",title: "Privacy Policy",));
                          }
                    )
                  ]
              )
            ]
        )
    );
  }
}