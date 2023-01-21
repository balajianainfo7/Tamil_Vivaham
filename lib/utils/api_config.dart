
import 'package:http/http.dart' as http;
import 'constants.dart';

class RestApiClient {

  final login =  Uri.parse("${URL}auth/login");
  final otpCreate =  Uri.parse("${URL}auth/sent-otp");
  final verifyOtp =  Uri.parse("${URL}auth/verify-otp");
  final forgotPassword =  Uri.parse("${URL}auth/forgotPasswordChange");
  final resetPassword =  Uri.parse("${URL}auth/resetpassword");
  //Stepper Register page API
  final register =  Uri.parse("${URL}auth/register");
  //Stepper Register Update page API
  final registerUpdate =  Uri.parse("${URL}auth/registerUpdate");
  //Edit Profile page API
  final communcationEdit =  Uri.parse("${URL}user/update/religion_community");
  final communcationAddressEdit =  Uri.parse("${URL}user/update/communication_detials");
  final permenentAddressEdit =  Uri.parse("${URL}user/update/permanent_address");
  final personalEdit =  Uri.parse("${URL}user/update/personal");
  final carrierEdit =  Uri.parse("${URL}user/update/carrier_and_working_details");
  final jathagamEdit =  Uri.parse("${URL}user/update/jathagam_details");
  final familyEdit =  Uri.parse("${URL}user/update/family_details");
  //Proposal API
  final receiviedProposal =  Uri.parse("${URL}proposal/getallreceivedproposal");
  final sendProposal =  Uri.parse("${URL}proposal/getallsendproposal");
  final acceptProposal =  Uri.parse("${URL}proposal/acceptproposal");
  final rejectProposal =  Uri.parse("${URL}proposal/rejectproposal");
  final withdrawProposal =  Uri.parse("${URL}proposal/withdrawproposal");
  //WishList
  final getallWishlist =  Uri.parse("${URL}user/getwishlist");
  final addWishlist =  Uri.parse("${URL}user/wishlist");
  final removeWishlist =  Uri.parse("${URL}user/removewishlist");
  //Post Story page API
  final postStory = Uri.parse("${URL}auth/post-new-feed");
  //Home page API
  final allUsers = Uri.parse("${URL}auth/all-user-details");
}