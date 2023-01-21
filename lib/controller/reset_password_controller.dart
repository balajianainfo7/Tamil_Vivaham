import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class ResetpasswordController extends BaseController{

var isEmailCorrect = "".obs;
TextEditingController oldPassowrdController = TextEditingController(text: '');
TextEditingController passowrdController = TextEditingController(text: '');
TextEditingController conformPasswordController = TextEditingController(text: '');
  
checkInput(context){
  if(oldPassowrdController.text.isEmpty){
    showSnackBar("Enter old password", context);
 
  } else if(passowrdController.text.isEmpty){
    showSnackBar("Enter password", context);
  }else if(conformPasswordController.text.isEmpty){
    showSnackBar("Enter conform password", context);
      if(oldPassowrdController.text.length < 6){
    
      showSnackBar("Check old password", context);
      }else if(passowrdController.text.length < 6){
          showSnackBar("Check password", context);
      showSnackBar("Check password", context);
      }else if(conformPasswordController.text.length < 6){
          showSnackBar("Check conform password", context);
      
      }else{
    resetPasswordAPI(context);
  }
  }else{
    showSnackBar("Enter correct old password ", context);
  }
}

resetPasswordAPI(context) async {
  final params = {"oldpassword": oldPassowrdController.text, "password":passowrdController.text, "confirm_password":conformPasswordController.text
          };
  final headers = <String, String>{"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0Mjg2ODE0LCJleHAiOjE2NzQyOTA0MTR9.OihCy0Coy-vqqnHdCDiGrBj0tqyb_EEItJKEb5Gs_YQ"};        
  print("Reset Password API Params: ${params}");
  http.post(
      RestApiClient().resetPassword,
      body: params, headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Reset Password Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        // appPreference.verified = res['data']["verified"];
        //   print("Verified: ${res['data']["verified"]}");
        //   // appPreference.accessToken = res["data"];
          appPreference.accessToken = res["data"];
          showSuccessSnackBar("Password Changed Succesfully", context);
          
          print("Token: ${res["data"]}");
          
          Get.toNamed(RouteNames.login);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

}