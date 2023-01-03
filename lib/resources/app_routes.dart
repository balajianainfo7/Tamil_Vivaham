
import 'package:get/get.dart';
import 'package:thirumanam/views/auth/Home_list_page.dart';
import 'package:thirumanam/views/auth/login_page.dart';
import 'package:thirumanam/views/auth/welcome_page.dart';

import '../views/auth/register_page.dart';

class Routes {
  //this is to prevent anyone from instantiating this object
  Routes._();

  /// routes list
  static List<GetPage<dynamic>> routes = [
    GetPage(name: RouteNames.welcome, page: () => WelcomePage()),
    GetPage(name: RouteNames.register, page: () => RegisterAuth()),
    GetPage(name: RouteNames.login, page: () => LoginAuth()),
    GetPage(name: RouteNames.home, page: () => HomePageView()),
  ];
}

class RouteNames {
  /// Your password screen
  static const welcome = '/';
  static const register = '/register_page';
  static const login = '/login_page';
  static const home = '/Home_list_page';
}
