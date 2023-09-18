import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_nest/screens/home/home.dart';
import 'package:memory_nest/utils/routes.dart';


class AppRoutes {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(routes: [
      GoRoute(
        name: AppRoutesConstants.homeRouteName,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      ),
    ]);

    return router;
  }
}