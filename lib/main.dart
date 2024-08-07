import 'package:clezigov/controllers/bookmarks_controller.dart';
import 'package:clezigov/controllers/notifications_controller.dart';
import 'package:clezigov/controllers/procedures_controller.dart';
import 'package:clezigov/controllers/profile_page_controller.dart';
import 'package:clezigov/controllers/reactions_controller.dart';
import 'package:clezigov/controllers/select_categories_controller.dart';
import 'package:clezigov/utils/app_theme.dart';
import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controllers/endorsements_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set color of status bar to scaffold bg
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: scaffoldBgColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: scaffoldBgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Lock device orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    // GetX Controllers
    Get.put(InterestsController());
    Get.put(BookmarksController());
    Get.put(NotificationsController());
    Get.put(EndorsementsController());
    Get.put(ReactionsController());
    Get.put(ProceduresController());
    Get.put(ProfilePageController());

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
