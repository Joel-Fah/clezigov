import 'package:clezigov/views/screens/auth/login.dart';
import 'package:clezigov/views/screens/home.dart';
import 'package:clezigov/views/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: OnboardPage.routeName,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: OnboardPage.routeName,
      name: 'onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: LoginPage.routeName,
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: HomePage.routeName,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
