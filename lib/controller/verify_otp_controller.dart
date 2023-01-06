import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class verifyOtpController extends BaseController{

var isEmailCorrect = "".obs;
TextEditingController otpController = TextEditingController(text: '');
TextEditingController mobileController = TextEditingController(text: '');
String verify = "FORGOT_PASSWORD";

checkInput(context){
  if(otpController.text.isEmpty){
    showSnackBar("Enter otp number", context);
  
  }else if(mobileController.text.isEmpty){
      showSnackBar("Enter email address/phone number", context);
  }else if(Utils().isValidEmail(mobileController.text)){
    if(otpController.text.length < 3){
      showSnackBar("Opt must contain 4 characters", context);
    }else{
      verifyOtpAPI(context);
    }
      }else{
    showSnackBar("Enter vaild otp number", context);
  }
}

verifyOtpAPI(context) async {
  final params = {"otp": otpController.text, "verification_for":verify, "emailphone": mobileController.text};
          final headers = {
            "x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNhNzEzMjMzYjY1YWQ4YzFkMzczNjhmIiwiaWF0IjoxNjcyODE3Njc1LCJleHAiOjE2NzI4MjEyNzV9.W0A-o8eqyWk0xuUSey7ko9L1RgPprJXz24F8xObwDpg"
          };
  print("Verify Otp API Params: ${params}");
  http.post(
      RestApiClient().verifyOtp,
      body: params, headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Verify Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
          // appPreference.accessToken = res["data"];
          Get.toNamed(RouteNames.resetPassword);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

}