import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thirumanam/views/forgot%20password/reset_password.dart';
import 'package:validators/validators.dart';

import '../../widget/quardentic_curve.dart';

class VerifyPassowrdOtp extends StatefulWidget {
  const VerifyPassowrdOtp({super.key});

  @override
  State<VerifyPassowrdOtp> createState() => VerifyPassowrdOtpState();
}

class VerifyPassowrdOtpState extends State<VerifyPassowrdOtp> {

  RegExp _email_phone =
    new RegExp(r'^(?:\d{10}|\w+@\w+\.\w{2,3})$');
    bool isEmailandPhone(String str) {
  return _email_phone.hasMatch(str);
}

      bool isEmailCorrect = false;  




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80")
                   ,fit: BoxFit.cover )),
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RotatedBox(
                  quarterTurns: -2,
                  child: Container(
                      // padding: EdgeInsets.only(top: 100),
                      child: Stack(
                    children: <Widget>[
                      // Image(image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"), width: 10,),
                      Container(
                        color: Colors.black,
                        width: 10,
                        height: 10,
                      ),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 0, top: 10, bottom: 10),
                                    child: Icon(Icons.arrow_circle_left_outlined,
                                        color: Colors.black, size: 32,),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
      
                      //stack overlaps widgets
                      Opacity(
                        //semi red clippath with more height and with 0.5 opacity
                        opacity: 0.5,
                        child: ClipPath(
                          clipper: WaveClipper(), //set our custom wave clipper
                          child: Container(
                            color: Colors.white,
                            height: 630,
                          ),
                        ),
                      ),
      
                      ClipPath(
                        //upper clippath with less height
                        clipper: WaveClipper(), //set our custom wave clipper.
                        child: Container(
                          padding: EdgeInsets.only(bottom: 50),
                          color: Colors.white,
                          height: 610,
                          alignment: Alignment.center,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 250),
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      child: StepProgressIndicator(
                                        totalSteps: 10,
                                        currentStep: 6,
                                        selectedColor: Colors.grey,
                                        unselectedColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 200, bottom: 50, left: 30),
                                          child: Text("Verify Otp",
                                              style: GoogleFonts.nunito(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700))),
                                      
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 300),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text("Enter OTP code sent to you mobile verification code",
                                          style: GoogleFonts.nunito(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700)
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, top: 25),
                                          child: Column(
                                            children: [
                                              
                        OTPTextField(
  length: 4,
  width: MediaQuery.of(context).size.width,
  fieldWidth: 40,
  style: TextStyle(
    fontSize: 17
  ),
  textFieldAlignment: MainAxisAlignment.spaceAround,
  fieldStyle: FieldStyle.box,
  onChanged: (value) {
    if(value.length == 4){
      FocusScope.of(context).nextFocus();
      print("completed"+ value);
      
    }
    
  },
  
),

                  
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(60.0),
                                          child: InkWell(
                    onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword()));
      },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                  ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ),
      ),
    );
  }
  
}