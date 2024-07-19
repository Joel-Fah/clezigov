import 'package:clezigov/controllers/bookmarks_controller.dart';
import 'package:clezigov/controllers/select_categories_controller.dart';
import 'package:clezigov/utils/app_theme.dart';
import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  // Set color of status bar white
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: scaffoldBgColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: scaffoldBgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX Controllers
    Get.put(InterestsController());
    Get.put(BookmarksController());

    return GetMaterialApp.router(
      title: 'CleziGov',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
