import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:thirumanam/views/auth/register_page.dart';
import 'package:validators/validators.dart';

import '../resources/app_routes.dart';
import '../utils/api_config.dart';

class StepperRegisterController extends BaseController{
  
  var isEmailCorrect = "".obs;
  var currentStep = 0;
  String verify = "MOBILE_REGISTRATION";
  String countryCodeController = "+91";
  TextEditingController otpController = TextEditingController(text: '');
  TextEditingController otp1Controller = TextEditingController(text: '');
TextEditingController firstNameController = TextEditingController(text: '');
TextEditingController lastNameController = TextEditingController(text: '');
TextEditingController nickNameController = TextEditingController(text: '');
TextEditingController dobController = TextEditingController(text: '');
TextEditingController ageController = TextEditingController(text: '');
TextEditingController mobileNumberController = TextEditingController(text: '');
TextEditingController emailController = TextEditingController(text: '');
TextEditingController passwordController = TextEditingController(text: '');
TextEditingController confirmPassowrdController = TextEditingController(text: '');
bool? veri;


//  final TextEditingController mobileController = TextEditingController(text: '');
 var  dropdownValue = "SON";
 var  dropdownValue0 = "CUSTOMER";
 var dropdownValue1 = 'MALE';

  var dropdownValue2 = 'HINDU';
  var dropdownValue3 = 'No_Caste';
  var dropdownValue4 = 'No_sub_caste';
  var dropdownValue5 = 'Nothing';
  var dropdownValue6 = 'Tamil';

  var dropdownValue7 = 'Chennai';
  var dropdownValue8 = 'Chennai';
  var dropdownValue9 = 'Tamilnadu';
  var dropdownValue10 = 'India';
  var dropdownValue11 = 'Indian';

  var dropdownValue12 = 'Chennai';
  var dropdownValue13 = 'Chennai';
  var dropdownValue14 = 'Tamilnadu';
  var dropdownValue15 = 'India';

  
  String dropdownValue17 = 'Fair';
  String dropdownValue18 = 'Vegitarian';
  String dropdownValue19 = 'Single';
  
  String dropdownValue20 = 'B.E';
  String dropdownValue21 = 'Chennai';

  String dropdownValue22 = 'Aries';
  String dropdownValue23 = 'Ashwini';
  String dropdownValue24 = 'Ashwini';
  String dropdownValue25 = 'Yes';
  String dropdownValue26 = 'Yes';
  String dropdownValue27 = 'Yes';

  String dropdownValue28 = '0';
  String dropdownValue29 = '0';
  String dropdownValue30 = '0';
  String dropdownValue31 = '0';
  String dropdownValue32 = '0';
  String dropdownValue33 = '0';
  String dropdownValue34 = '0';
  String dropdownValue35 = '0';


  checkInput(context){
    appPreference.verified = veri;
  if(firstNameController.text.isEmpty){
    showSnackBar("Enter First Name", context);
  }else if(lastNameController.text.isEmpty){
    showSnackBar("Enter Last Name", context);
  }else if(nickNameController.text.isEmpty){
    showSnackBar("Enter Nick Name", context);
  }else if(ageController.text.isEmpty){
    showSnackBar("Enter Age", context);
  }else if(dobController.text.isEmpty){
    showSnackBar("Enter Date of Birth", context);
  }else if(mobileNumberController.text.isEmpty){
    showSnackBar("Enter Mobile Number", context);
  }else if(emailController.text.isEmpty){
    showSnackBar("Enter email address", context);
  }else if(passwordController.text.isEmpty){
    showSnackBar("Enter Password", context);
  }else if(confirmPassowrdController.text.isEmpty){
    showSnackBar("Enter Confirm Password", context);
  }
  else{
    print(appPreference.verified);
      print("objecaaat");
      print(registerAPI(context));
      registerAPI(context);
      // registerAPI(context);
    }
  
}

registerAPI(context) async {
  final headers = {"Content-Type": "application/json"};
  final data = {"ProfileFor": dropdownValue,
  "userType": dropdownValue0, "MobileNo": mobileNumberController.text,"CountryCode": countryCodeController
  ,"Email": emailController.text,"password": passwordController.text,"confirm_password": confirmPassowrdController.text
  ,"FirstName": firstNameController.text,"lastName": lastNameController.text,"NickName": nickNameController.text
  ,"Gender": dropdownValue1,"Age": ageController.text,"DOB": dobController.text};
  final params ={ "data":data};
  print("Register API Params: ${params}");
  http.post(
      RestApiClient().register,
      
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Register Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          
          currentStep = 1;
          print(currentStep = 1);
          
          print("balaji");
      }else{
        showSnackBar(res["message"].toString(), context);
        print("object1");
      }
    }
  });

}

forgotEmailInput(context){
  if(emailController.text.isEmpty){
    showSnackBar("Enter email address", context);
  
  }else if(Utils().isValidEmail(emailController.text)){
      forgotEmailAPI(context);

      }else{
    showSnackBar("Enter vaild email address", context);
  }
}

forgotEmailAPI(context) async {
  final params = {"email": emailController.text, "verification_for":verify
          };
          
  print("Forgot Password API Params: ${params}");
  http.post(
      RestApiClient().otpCreate,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Forgot Password Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        String verify = "MOBILE_REGISTRATION";
        String mobileNumber = '';
          // appPreference.accessToken = res["data"];
          Dialogs.materialDialog(
                                  msg: 'Enter the otp code for verification.\nYou can either phone or email verification.',
                                  // title: "Delete",
                                  color: Colors.white,
                                  context: context,
                                  dialogWidth: kIsWeb ? 0.3 : null,
                                  onClose: (value) =>
                                      print("returned value is '$value'"),
                                  actions: [
                                    
                                    Column(
                                      children: [
                                        TextFormField(
                                          controller: emailController,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Email",
                                            labelText: "Email",
                                            hintStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.people,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: otpController,
                                        style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Otp",
                                            labelText: "Otp",
                                            hintStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.people,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        IconsButton(
                                          onPressed: () {
                                            verifyEmailInput(context);
                                          },
                                          text: "Verify",
                                          iconData: Icons.verified,
                                          color: Colors.green,
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ]);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

verifyEmailInput(context){
      verifyEmailAPI(context);
  
}

verifyEmailAPI(context) async {
  final params = {"otp": otpController.text, "verification_for":verify, "email": emailController.text};
          
  print("Verify Otp API Params: ${params}");
  http.post(
      RestApiClient().verifyOtp,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Verify Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
          // appPreference.accessToken = res["data"];
          Navigator.pop(context);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

forgotPhoneInput(context){
  if(mobileNumberController.text.isEmpty){
    showSnackBar("Enter phone number", context);
  
  }else if(isNumeric(mobileNumberController.text)){
      forgotPhoneAPI(context);

      }else{
    showSnackBar("Enter vaild phone Number", context);
  }
}

forgotPhoneAPI(context) async {
  final params = {"mobile_number": mobileNumberController.text, "verification_for":verify
          };
          
  print("Forgot Password API Params: ${params}");
  http.post(
      RestApiClient().otpCreate,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Forgot Password Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        appPreference.verified = res["data"]["verified"];
          print("Verified: ${res["data"]["verified"]}");
        String verify = "MOBILE_REGISTRATION";
        String mobileNumber = '';
        
          // appPreference.accessToken = res["data"];
          Dialogs.materialDialog(
                                  msg: 'Enter the otp code for verification.\nYou can either phone or email verification.',
                                  // title: "Delete",
                                  color: Colors.white,
                                  context: context,
                                  dialogWidth: kIsWeb ? 0.3 : null,
                                  onClose: (value) =>
                                      print("returned value is '$value'"),
                                  actions: [
                                    
                                    Column(
                                      children: [
                                        TextFormField(
                                          controller: mobileNumberController,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Phone Number",
                                            labelText: "Phone Number ",
                                            hintStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.people,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: otp1Controller,
                                        style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Otp",
                                            labelText: "Otp",
                                            hintStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.people,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        IconsButton(
                                          onPressed: () {
                                            verifyPhoneInput(context);
                                          },
                                          text: "Verify",
                                          iconData: Icons.verified,
                                          color: Colors.green,
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ]);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

verifyPhoneInput(context){
  
      verifyPhoneAPI(context);
  
}

verifyPhoneAPI(context) async {
  final params = {"otp": otp1Controller.text, "verification_for":verify, "mobile_number": mobileNumberController.text};
          
  print("Verify Otp API Params: ${params}");
  http.post(
      RestApiClient().verifyOtp,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Verify Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        appPreference.verified = res["data"]["verified"];
          print("Verified: ${res["data"]["verified"]}");
         

          Navigator.pop(context);
          print("object");
          
      }else{
        showSnackBar(res["message"], context);
        print("object1");
        
      }
    }
  });

}



}