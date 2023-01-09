import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/controller/register_controller.dart';
import 'package:validators/validators.dart';

import '../../widget/quardentic_curve.dart';

class LoginAuth extends StatefulWidget {
  @override
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {

  final controller = Get.find<RegisterController>();

  final _key = new GlobalKey<FormState>();
   bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  check() {

  }

  // login() async {
  //   final response = await http.post(
  //     Uri.parse(
  //         "http://ec2-18-212-165-158.compute-1.amazonaws.com:8000/auth/login"),
  //     headers: <String, String>{
  //       'Content-type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "emailphone": emailphone,
  //       "password": password,
  //     }),
  //   );
  //
  //   print(response.body);
  //   final data = jsonDecode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     print("object");
  //     print(data);
  //     setState(() {
  //       Get.toNamed(RouteNames.home);
  //     });
  //     loginToast("Login Sucessfull");
  //   } else if (response.statusCode == 400) {
  //     loginToast("Email or password is not correct");
  //   } else {
  //     loginToast("Login Failed");
  //   }
  // }
  //
  // loginToast(String toast) {
  //   return Fluttertoast.showToast(
  //       msg: toast,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 3,
  //       backgroundColor:
  //           toast == "Login Sucessfull" ? Colors.green : Colors.red,
  //       textColor: Colors.white);
  // }
  //
  // bool isEmailCorrect = false;
  // bool _secureText = true;
  // bool? remember = false;
  // showHide() {
  //   setState(() {
  //     _secureText = !_secureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/1324575840/photo/the-groom-proposes-to-his-bride-and-puts-the-ring-on-his-finger-close-up-wedding-ceremony-and.jpg?b=1&s=170667a&w=0&k=20&c=_u_B517p-F9r56Dbzzc5CvUTw4V9Z29L-VG3gwqbJP8="),
                  fit: BoxFit.fill)),
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
                                  child: Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: Colors.black,
                                    size: 32,
                                  ),
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
                                    padding:
                                        EdgeInsets.only(bottom: 50, right: 280),
                                    child: Text("Login",
                                        style: GoogleFonts.nunito(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Form(
                                    key: _key,
                                    child: Column(
                                      children: [
                                        TextField(
                                         controller: controller.emailController,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            hintText: "FirstName",
                                            hintStyle: TextStyle(color: AppColors.hintTextColor),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            // contentPadding:
                                            // const EdgeInsetsDirectional.only(
                                            //     start: 20, end: 10),
                                            suffixIcon: controller.isEmailCorrect == "false"
                                                ? Icon(
                                                    Icons.close_sharp,
                                                    color: Colors.red,
                                                  )
                                                :  controller.isEmailCorrect == "true"?
                                                    Icon(
                                                    Icons.done,
                                                    color: Colors.green,
                                                  ) : Container(width: 0,),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.people,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        TextField(
                                          controller: controller.passwordController,
                                          obscureText: _secureText,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: TextStyle(color: AppColors.hintTextColor),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.password,
                                                  color: Colors.black),
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: (){
                                                controller.secureText.value = !controller.secureText.value;
                                              },
                                              icon: Icon(controller.secureText.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        InkWell(
                                          onTap: () {
                                            controller.checkInput(context);
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade200,
                                                      offset: Offset(2, 4),
                                                      blurRadius: 5,
                                                      spreadRadius: 2)
                                                ],
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors:
                                                        AppColors.buttonColor)),
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                             Get.toNamed(RouteNames.forgotPassword);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            alignment: Alignment.centerRight,
                                            child: Text('Forgot Password ?',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500)),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: Divider(
                                                    thickness: 1,
                                                  ),
                                                ),
                                              ),
                                              Text('or'),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: Divider(
                                                    thickness: 1,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(RouteNames.register);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            padding: EdgeInsets.all(15),
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Don\'t have an account ?',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Register',
                                                  style: TextStyle(
                                                      color: Color(0xfff79c4f),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
