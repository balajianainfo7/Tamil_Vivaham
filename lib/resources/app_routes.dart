
import 'package:get/get.dart';
import 'package:thirumanam/views/auth/Home_list_page.dart';
import 'package:thirumanam/views/auth/login_page.dart';
// import 'package:thirumanam/views/auth/sample.dart';
import 'package:thirumanam/views/auth/splash.dart';
import 'package:thirumanam/views/auth/welcome_page.dart';
import 'package:thirumanam/views/dashboard/dashboard_page.dart';
import 'package:thirumanam/views/forgot%20password/Forgot_password.dart';
import 'package:thirumanam/views/forgot%20password/reset_password.dart';
import 'package:thirumanam/views/forgot%20password/verify_passowrd_otp.dart';
import 'package:thirumanam/views/search_page.dart';

import '../views/auth/register_page.dart';

class Routes {
  //this is to prevent anyone from instantiating this object
  Routes._();

  /// routes list
  static List<GetPage<dynamic>> routes = [
    GetPage(name: RouteNames.splash, page: () => Splash()),
    GetPage(name: RouteNames.welcome, page: () => WelcomePage()),
    GetPage(name: RouteNames.register, page: () => RegisterAuth()),
    GetPage(name: RouteNames.login, page: () => LoginAuth()),
    GetPage(name: RouteNames.home, page: () => HomePageView()),
    GetPage(name: RouteNames.dashboard, page: () => DashboradPage()),
    GetPage(name: RouteNames.forgotPassword, page: () => ForgotPassword()),
    GetPage(name: RouteNames.resetPassword, page: () => ResetPassword()),
    GetPage(name: RouteNames.verifyPassowrd, page: () => VerifyPassowrdOtp()),
    GetPage(name: RouteNames.search, page: () => SearchPage()),
    // GetPage(name: RouteNames.sample, page: () => DatePickerPage(title: '',)),
  ];
}

class RouteNames {
  /// Your password screen
  static const splash = '/';
  static const welcome = '/welcome_page';
  static const register = '/register_page';
  static const login = '/login_page';
  static const home = '/Home_list_page';
  static const dashboard = '/dashboard_page';
  static const forgotPassword = '/forgot_password';
  static const resetPassword = '/reset_password';
  static const verifyPassowrd = '/verify_passowrd_otp';
  static const search= '/search_page';
}
