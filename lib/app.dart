import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/resources/app_style.dart';
import 'package:thirumanam/views/auth/splash.dart';
import 'package:thirumanam/views/auth/welcome_page.dart';

import 'binding/main_binding.dart';
import 'preferences/app_preference.dart';

class App extends StatelessWidget {
  static final App _instance = App._internal();

  App._internal();

  final appPref = Get.put(AppPreference());

  factory App() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      defaultTransition: Transition.leftToRight,
      title: 'Thirumanam',
      // darkTheme: AppStyles.darkTheme,
      // routes: Routes.routes, TODO : fix

      theme: AppStyles.lightTheme(),
      getPages: Routes.routes,
      initialRoute: RouteNames.splash,
      // getPages: [
      //   GetPage(name: '/recordDetails', page: () => RecordDetailsView())
      // ]
    );
  }
}