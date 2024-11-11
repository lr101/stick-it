import 'dart:convert';

import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_overview.dart';
import 'package:buff_lisa/features/group_overview/presentation/user_group_overview.dart';
import 'package:buff_lisa/features/navigation/presentation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

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

  static GoRouter goRoute(bool isLoggedIn) {return GoRouter(
    initialLocation: isLoggedIn ? '/' : '/login',
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithAnimation(const Auth());
        },
      ),
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithAnimation(const Navigation());
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'groups/:groupId',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return buildPageWithAnimation(
                UserGroupOverview(groupId: state.pathParameters['groupId']!),
              );
            },
          ),
        ],
      ),
    ],
  );
  }


}