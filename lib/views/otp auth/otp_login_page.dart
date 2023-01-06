import 'package:flutter/material.dart';

import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import 'api_service.dart';
import 'otp_verify_page.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegExp _email_phone =
    new RegExp(r'^(?:\d{10}|\w+@\w+\.\w{2,3})$');
    bool isEmailandPhone(String str) {
  return _email_phone.hasMatch(str);
}
bool isEmailCorrect = false;  

  String mobileNumber = '';
  bool enableBtn = false;
  bool isAPIcallProcess = false;

  @override
  void initState() {
    super.initState();
    mobileNumber = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          
          
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child:
                
                
                TextFormField(
                    maxLines: 1,
                    // maxLength: 10,
                    
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Email/Phone Number",
                      labelText: "Email/Phone Number",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: isEmailCorrect == false
                          ? Icon(
                              Icons.close_sharp,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.verified_outlined, color: Colors.black),
                      ),
                    ),
                    onChanged: (String value) {
                        isEmailCorrect= isEmailandPhone(value);
                      
                      if (value.length > 8) {
                        mobileNumber = value;
                        enableBtn = true;
                      }
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
               
              
          ),
          Center(
            child: FormHelper.submitButton(
              "Continue",
              () async {
                if (enableBtn && mobileNumber.length > 8) {
                  setState(() {
                    isAPIcallProcess = true;
                  });

                  APIService.otpLogin(mobileNumber).then((response) async {
                    setState(() {
                      isAPIcallProcess = false;
                    });

                    if (response.data != null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPVerifyPage(
                            otpHash: response.data,
                            mobileNo: mobileNumber,
                          ),
                        ),
                        (route) => false,
                      );
                    }
                  });
                }
              },
              btnColor: Color(0xfff7892b),
              borderColor: Color(0xfff7892b),
              // borderColor: HexColor("#78D0B1"),
              txtColor: Colors.white,
              borderRadius: 20,
            ),
          ),
        ],
      ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }
}