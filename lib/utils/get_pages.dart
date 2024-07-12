import 'package:get/get.dart';

import '../views/screens/auth/login/login.dart';
import '../views/screens/onboarding.dart';

final List<GetPage> getPages = [
  GetPage(
    name: OnboardPage.routeName,
    page: () => const OnboardPage(),
  ),
  GetPage(
    name: LoginPage.routeName,
    page: () => const LoginPage(),
  ),
];
