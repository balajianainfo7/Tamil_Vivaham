
import 'package:get/get.dart';
import 'package:thirumanam/views/auth/login_page.dart';
import 'package:thirumanam/views/auth/welcome_page.dart';
import 'package:thirumanam/views/dashboard/dashboard_page.dart';

import '../views/auth/register_page.dart';

class Routes {
  //this is to prevent anyone from instantiating this object
  Routes._();

  /// routes list
  static List<GetPage<dynamic>> routes = [
    GetPage(name: RouteNames.welcome, page: () => WelcomePage()),
    GetPage(name: RouteNames.register, page: () => RegisterAuth()),
    GetPage(name: RouteNames.login, page: () => LoginAuth()),
    GetPage(name: RouteNames.dashboard, page: () => DashboradPage()),
  ];
}

class RouteNames {
  /// Your password screen
  static const welcome = '/';
  static const register = '/register_page';
  static const login = '/login_page';
  static const dashboard = '/dashboard_page';
}
