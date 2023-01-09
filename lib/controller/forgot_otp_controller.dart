import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class ForgotOtpController extends BaseController{

var isEmailCorrect = "".obs;
TextEditingController mobileController = TextEditingController(text: '');
String verify = "FORGOT_PASSWORD";

checkInput(context){
  if(mobileController.text.isEmpty){
    showSnackBar("Enter email address/phone number", context);
  
  }else if(Utils().isValidEmail(mobileController.text)){
    
      forgotOtpAPI(context);
      }else{
    showSnackBar("Enter vaild email address/phone number", context);
  }
}

forgotOtpAPI(context) async {
  final params = {"emailphone": mobileController.text, "verification_for":verify
          };
          final headers = {
            "x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNhNzEzMjMzYjY1YWQ4YzFkMzczNjhmIiwiaWF0IjoxNjcyODE3Njc1LCJleHAiOjE2NzI4MjEyNzV9.W0A-o8eqyWk0xuUSey7ko9L1RgPprJXz24F8xObwDpg"
          };
  print("Forgot Password API Params: ${params}");
  http.post(
      RestApiClient().otpCreate,
      body: params, headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Forgot Password Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        appPreference.verified = res['data']["verified"];
          print("Verified: ${res['data']["verified"]}");
          // appPreference.accessToken = res["data"];
          appPreference.accessToken = res["data"];
          
          print("Token: ${res["data"]}");
          
          Get.toNamed(RouteNames.verifyPassowrd);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

}