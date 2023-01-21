
import 'package:get/get.dart';
import 'package:thirumanam/views/auth/Home_list_page.dart';
import 'package:thirumanam/views/auth/login_page.dart';
import 'package:thirumanam/views/auth/reset_password.dart';
// import 'package:thirumanam/views/auth/sample.dart';
import 'package:thirumanam/views/auth/splash.dart';
import 'package:thirumanam/views/auth/welcome_page.dart';
import 'package:thirumanam/views/dashboard/dashboard_page.dart';
import 'package:thirumanam/views/forgot%20password/Forgot_password.dart';
import 'package:thirumanam/views/forgot%20password/change_password.dart';
import 'package:thirumanam/views/forgot%20password/verify_passowrd_otp.dart';
import 'package:thirumanam/views/proposal_page/proposal_received.dart';
import 'package:thirumanam/views/proposal_page/send_proposal.dart';
// import 'package:thirumanam/views/proposal_received.dart';
import 'package:thirumanam/views/profile/profile_page.dart';
import 'package:thirumanam/views/proposal_page/wishlist_page.dart';
// import 'package:thirumanam/views/recivied_proposal.dart';
import 'package:thirumanam/views/search_page.dart';
import 'package:thirumanam/views/story_post.dart';
// import 'package:thirumanam/views/send_proposal.dart';

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
    GetPage(name: RouteNames.changePassword, page: () => ChangePassword()),
    GetPage(name: RouteNames.verifyPassowrd, page: () => VerifyPassowrdOtp()),
    GetPage(name: RouteNames.search, page: () => SearchPage()),
    GetPage(name: RouteNames.profile, page: () => ProfilePage()),
    GetPage(name: RouteNames.receiviedProprosal, page: () => ProposalReceived()),
    GetPage(name: RouteNames.sendProposal, page: () => SendReceived()),
    GetPage(name: RouteNames.wishList, page: () => WishListReceived()),
    GetPage(name: RouteNames.resetPassword, page: () => ResetPassword()),
    GetPage(name: RouteNames.storyPost, page: () => StroyPost()),
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
  static const changePassword = '/change_password';
  static const verifyPassowrd = '/verify_passowrd_otp';
  static const search= '/search_page';
  static const profile= '/profile_page';
  static const receiviedProprosal= '/proposal_received';
  static const sendProposal= '/send_proposal';
  static const wishList = '/wishlist_page';
  static const resetPassword = '/reset_password';
  static const storyPost = '/story_post';
}
