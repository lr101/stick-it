import 'dart:convert';

import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/group_overview/presentation/no_user_group_overview.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_overview.dart';
import 'package:buff_lisa/features/group_overview/presentation/user_group_overview.dart';
import 'package:buff_lisa/features/navigation/presentation/navigation.dart';
import 'package:buff_lisa/features/profile/presentation/other_user_profile.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/service/global_data_service.dart';
import '../../features/auth/presentation/auth.dart';

class Routing {

  static Future<dynamic> to(BuildContext context, Widget to, [bool transition = true]) async {
    return await Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => to,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        )
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
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
        ModalRoute.withName(routeName)
    );
  }

  // Helper function to create a page with a slide transition
  static CustomTransitionPage buildPageWithAnimation(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage loadingPage({String text = "Loading..."}) {
    return buildPageWithAnimation(
      Scaffold(
        appBar: null,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text(text)
            ],
          ),
        ),
      )
    );
  }

  static GoRouter goRoute(WidgetRef ref) {return GoRouter(
    initialLocation: ref.watch(globalDataServiceProvider).refreshToken != null ? '/deeplink' : '/deeplink/login',
    routes: <RouteBase>[
      GoRoute(
        path: '/deeplink/login',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithAnimation(const Auth());
        },
      ),
      GoRoute(
        path: '/deeplink',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithAnimation(const Navigation());
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'groups/:groupId',
            pageBuilder: (BuildContext context, GoRouterState state) {
              final isUserGroup = ref.watch(userGroupServiceProvider.select((e) => e.value?.any((f) => f.groupId == state.pathParameters['groupId'])));
              if (isUserGroup == null) {
                return loadingPage();
              } else if (isUserGroup) {
                return buildPageWithAnimation(UserGroupOverview(groupId: state.pathParameters['groupId']!),);
              } else {
                return buildPageWithAnimation(NoUserGroupOverview(groupId: state.pathParameters['groupId']!,));
              }
            },
          ),
          GoRoute(
            path: 'groups/:groupId/join/:inviteUrl',
            pageBuilder: (BuildContext context, GoRouterState state) {
              final isUserGroup = ref.watch(userGroupServiceProvider.select((e) => e.value?.any((f) => f.groupId == state.pathParameters['groupId'])));
              if (isUserGroup == true) {
                return buildPageWithAnimation(
                  UserGroupOverview(groupId: state.pathParameters['groupId']!),
                );
              } else if (isUserGroup == false) {
                ref.read(userGroupServiceProvider.notifier)
                    .joinGroup(state.pathParameters['groupId']!, inviteUrl: state.pathParameters['inviteUrl']!)
                    .then((e) => e != null ? CustomErrorSnackBar.message(message: e) : null);
                return loadingPage(text: "Joining group...");
              } else {
                return loadingPage();
              }
            },
          ),
          GoRoute(path: 'users/:userId',
          pageBuilder: (BuildContext context, GoRouterState state) {
            if (state.pathParameters['userId'] == ref.watch(globalDataServiceProvider).userId) {
              return buildPageWithAnimation(OtherUserProfile(userId: state.pathParameters['userId']!));
            } else {
              return buildPageWithAnimation(const Navigation());
            }
          })
        ],
      ),
    ],
  );
  }


}