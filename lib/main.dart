import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rajishthanapp/route/app_pages.dart';
import 'package:rajishthanapp/theme/theme.dart';
import 'package:rajishthanapp/theme/theme_service.dart';

import 'api-handler/api-handler.dart';
import 'api-handler/api-repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ApiBaseHelper(), permanent: true);
  Get.put(ApiRepository(Get.find()));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white.withOpacity(0.0),
    // navigation bar color
    statusBarColor: Colors.white.withOpacity(0.0), // status bar color
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    );
  }
}
