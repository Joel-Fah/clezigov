import 'package:clezigov/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CleziGov',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: OnboardPage.routeName,
      routes: {
        OnboardPage.routeName: (context) => const OnboardPage(),
      },
    );
  }
}
