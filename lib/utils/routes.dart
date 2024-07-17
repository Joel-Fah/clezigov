import 'package:clezigov/views/screens/auth/forgot%20password/email_verification.dart';
import 'package:clezigov/views/screens/auth/forgot%20password/forgot_password.dart';
import 'package:clezigov/views/screens/auth/forgot%20password/reset_password.dart';
import 'package:clezigov/views/screens/auth/login/login.dart';
import 'package:clezigov/views/screens/auth/register/account_setup.dart';
import 'package:clezigov/views/screens/auth/register/points_of_interests.dart';
import 'package:clezigov/views/screens/home/home.dart';
import 'package:clezigov/views/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

import '../views/screens/auth/register/user_registration.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: HomePage.routeName,
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
    // Forgot password route
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: ForgotPasswordPage.routeName,
      name: 'forgotPassword',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: EmailVerificationPage.routeName,
      name: 'emailVerification',
      builder: (context, state) => const EmailVerificationPage(
        email: 'joelfah2003@gmail.com',
      ),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: ResetPasswordPage.routeName,
      name: 'resetPassword',
      builder: (context, state) => const ResetPasswordPage(),
    ),
    // Registration routes
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: UserRegistrationPage.routeName,
      name: 'userRegistration',
      builder: (context, state) => const UserRegistrationPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: AccountSetup.routeName,
      name: 'accountSetup',
      builder: (context, state) => const AccountSetup(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: PointsOfInterestsPage.routeName,
      name: 'pointsOfInterest',
      builder: (context, state) => const PointsOfInterestsPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: HomePage.routeName,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

// Extension to push routes
extension GoRouteExtension on BuildContext {
  goPush<T>(String route) =>
      kIsWeb ? GoRouter.of(this).go(route) : GoRouter.of(this).push(route);
}
