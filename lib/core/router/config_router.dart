import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:project_management/core/heares_config.dart';
import 'package:project_management/model/token/tokenmodel.dart';
import 'package:project_management/view/LoginPage%20.dart';
import 'package:project_management/view/SingupPage.dart';
import 'package:project_management/view/create_join.dart';
import 'package:project_management/view/create_project.dart';
import 'package:project_management/view/createtask.dart';
import 'package:project_management/view/viewproject.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        box = Hive.box('projectBox');
        tokenmodel? token = box.get('token');

        if (token != null) {
          return creatjoinPage();
        } else {
          return RegisterPage();
        }
      },
      routes: [
        GoRoute(
          path: 'signup',
          builder: (context, state) {
            return RegisterPage();
          },
          routes: [
            GoRoute(
              path: 'home',
              builder: (context, state) {
                return creatjoinPage();
              },
              routes: [
                GoRoute(
                  path: 'newproject',
                  builder: (context, state) {
                    return creatPage();
                  },
                  routes: [
                    GoRoute(
                      path: 'newtask',
                      builder: (context, state) {
                        return DynamicTextField();
                      },
                      routes: [
                        GoRoute(
                          path: 'viweproject',
                          builder: (context, state) {
                            return viweproject();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginPage();
          },
        ),
        // GoRoute(
        //   path: 'register',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return RegisterPage();
        //   },
        // ),
      ],
    ),
  ],
);
