
import 'package:http/http.dart' as http;
import 'constants.dart';

class RestApiClient {

  final login =  Uri.parse("${URL}auth/login");
  final otpCreate =  Uri.parse("${URL}auth/sent-otp");
  final verifyOtp =  Uri.parse("${URL}auth/verify-otp");
  final register =  Uri.parse("${URL}auth/register");
  final registerUpdate =  Uri.parse("${URL}auth/registerUpdate");
  //Home page API
  final allUsers = Uri.parse("${URL}auth/all-user-details");
}