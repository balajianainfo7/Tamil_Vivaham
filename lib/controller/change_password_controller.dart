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

class ChangepasswordController extends BaseController{

var isEmailCorrect = "".obs;
final controller = Get.find<ForgotOtpController>();

TextEditingController passowrdController = TextEditingController(text: '');
TextEditingController conformPasswordController = TextEditingController(text: '');
  
checkInput(context){
  if(controller.mobileController.text.isEmpty){
    showSnackBar("Enter email address/phone number", context);
 
  } else if(passowrdController.text.isEmpty){
    showSnackBar("Enter password", context);
  }else if(conformPasswordController.text.isEmpty){
    showSnackBar("Enter conform password", context);
      if(Utils().isValidEmail(controller.mobileController.text)){
    
      
      }else if(passowrdController.text.length < 6){
          showSnackBar("Check password", context);
      showSnackBar("Enter password", context);
      }else if(conformPasswordController.text.length < 6){
          showSnackBar("Check conform password", context);
      showSnackBar("Enter conform password", context);
      }
      else{
    forgotOtpAPI(context);
  }
  }else{
    showSnackBar("Enter vaild email address/phone number", context);
  }
}

forgotOtpAPI(context) async {
  final params = {"emailphone": controller.mobileController.text, "password":passowrdController.text, "confirm_password":conformPasswordController.text
          };
          
  print("Forgot Password API Params: ${params}");
  http.post(
      RestApiClient().forgotPassword,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Forgot Password Response: ${res.toString()}");
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