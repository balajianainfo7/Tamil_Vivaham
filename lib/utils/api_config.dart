
import 'package:http/http.dart' as http;
import 'constants.dart';

class RestApiClient {

  final login =  Uri.parse("${URL}auth/login");

  //Home page API
  final allUsers = Uri.parse("${URL}auth/all-user-details");
}