import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'base_controller.dart';

class RegisterController extends BaseController{

var isEmailCorrect = "".obs;
var secureText = false.obs;
TextEditingController emailController = TextEditingController(text: '');
TextEditingController passwordController = TextEditingController(text: '');

checkInput(context){
  if(emailController.text.isEmpty){
    showSnackBar("Enter email address", context);
  }else if(passwordController.text.isEmpty){
    showSnackBar("Enter password", context);
  }else if(Utils().isValidEmail(emailController.text)){
    if(passwordController.text.length < 6){
      showSnackBar("Password must atleast contain 8 characters", context);
    }else{
      loginAPI(context);
    }
  }else{
    showSnackBar("Enter vaild email address", context);
  }
}

loginAPI(context) async {
  final params = {"emailphone": emailController.text,
          "password": passwordController.text};
  print("Login API Params: ${params}");
  http.post(
      RestApiClient().login,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Login Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
          appPreference.accessToken = res["data"];
          Get.toNamed(RouteNames.dashboard);
      }else{
        showSnackBar(res["message"], context);
      }
    }
  });

}

}