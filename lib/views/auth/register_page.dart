import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thirumanam/controller/communication_register.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import '../../controller/address_register_controller.dart';
import '../../controller/carrier_deatils_controller.dart';
import '../../controller/family_details_controller.dart';
import '../../controller/jathagam_details_controller.dart';
import '../../controller/personal_details_controller.dart';

class RegisterAuth extends StatefulWidget {
  @override
  _RegisterAuthState createState() => _RegisterAuthState();
}

class _RegisterAuthState extends State<RegisterAuth> {
  String countryCodeController = "+91";
  @override
  void initState() {
    super.initState();
    countryCodeController = "+91";
    mobileNumber = '';
    verify = "MOBILE_REGISTRATION";
  }
  final controller = Get.find<StepperRegisterController>();
  final controller1 = Get.find<AdresssRegisterController>();
  final controller2 = Get.find<CommunicationRegisterController>();
  final controller3 = Get.find<PersonalRegisterController>();
  final controller4 = Get.find<CarrierRegisterController>();
  final controller5 = Get.find<JathgamRegisterController>();
  final controller6 = Get.find<FamilyRegisterController>();

  String mobileNumber = '';
  String verify = "FORGOT_PASSWORD";
  
  
  bool isCompleted = false;
 
  bool _secureText = true;
  bool? remember = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"),
                  fit: BoxFit.cover)),
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
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 5, right: 150, left: 30),
                                        child: Text("Register",
                                            style: GoogleFonts.nunito(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text("Go to login",
                                            style: GoogleFonts.nunito(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                                fontSize: 20,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                                Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary: Color(0xFF0C8CE9)),
                                        ),
                                        child: Container(
                                          child: Stepper(
                                            // controlsBuilder: (context, ControlsDetails details)
                                            type: StepperType.vertical,
                                            physics: ScrollPhysics(),

                                            steps: getStep(),
                                            currentStep: controller.currentStep,
                                            onStepContinue: () {
                                              final isLastStep =
                                                  controller.currentStep ==
                                                      getStep().length - 1;
                                              final isFrstStep =
                                                  controller.currentStep == 0;
                                              final issecondStep =
                                                  controller.currentStep == 1;
                                              final isthirdStep =
                                                  controller.currentStep == 2;
                                                  final isFouth =
                                                  controller.currentStep == 3;
                                                  final isFifthStep =
                                                  controller.currentStep == 4;
                                                  final isSixthStep =
                                                  controller.currentStep == 5;


                                              if (isLastStep) {
                                                controller6.checkInput(context);
                                                print('Completed');
                                              } else if (isFrstStep) {
                                                 controller.checkInput(context);
                                                print("object");
                                              }else if (issecondStep) {
                                                controller1.checkInput(context);
                                                print("object");
                                              } else if (isthirdStep) {
                                                controller2.checkInput(context);
                                                print("object");
                                              }else if (isFouth) {
                                                controller3.checkInput(context);
                                                print("object");
                                              }else if (isFifthStep) {
                                                controller4.checkInput(context);
                                                print("object");
                                              }else if (isSixthStep) {
                                                controller5.checkInput(context);
                                                print("object");
                                              } else {
                                                print(isFrstStep);
                                                // setState(() => currentStep += 1);
                                              }
                                            },
                                            onStepTapped: (step) => setState(
                                                () => controller.currentStep =
                                                    step),
                                            onStepCancel:
                                                controller.currentStep == 0
                                                    ? null
                                                    : () => setState(() =>
                                                        controller
                                                            .currentStep -= 1),

                                            controlsBuilder: ((BuildContext
                                                    context,
                                                ControlsDetails controls,
                                                {VoidCallback? onStepContinue,
                                                VoidCallback? onStepCancel}) {
                                              final isLastStep =
                                                  controller.currentStep ==
                                                      getStep().length - 1;
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(top: 50),
                                                child: Row(
                                                  children: [
                                                    if (controller.currentStep !=
                                                        0)
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0))),
                                                          onPressed: controls
                                                              .onStepCancel,
                                                          child: Text("Back")),
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.0))),
                                                        onPressed: controls
                                                            .onStepContinue,
                                                        child: Text(isLastStep
                                                            ? "Confirm"
                                                            : "Next")),
                                                  ],
                                                ),
                                              );
                                            }),
                                            //  controlsBuilder: (BuildContext context, ControlsDetails details)
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

  List<Step> getStep() => [
        Step(
            state: controller.currentStep > 0
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep >= 0,
            title: Text(
              "Basic Information",
              style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            content: Form(
              // key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Profile For",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.blue,
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: controller.dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        controller.dropdownValue = newValue!;
                      });
                    },
                    items: <String>['SON', 'DAUGHTER']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "nunto"),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "UserType",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.blue,
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: controller.dropdownValue0,
                    onChanged: (String? newValue) {
                      setState(() {
                        controller.dropdownValue0 = newValue!;
                      });
                    },
                    items: <String>['CUSTOMER', 'ADMIN']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "nunto"),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.firstNameController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "First Name",
                      labelText: "FirstName",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.lastNameController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Last Name",
                      labelText: "LastName",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.nickNameController,
                    
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "NickName",
                      labelText: "NickName",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.nature_people, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.blue,
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: controller.dropdownValue1,
                    onChanged: (String? newValue1) {
                      setState(() {
                        controller.dropdownValue1 = newValue1!;
                      });
                    },
                    items: <String>['MALE', 'FEMALE']
                        .map<DropdownMenuItem<String>>((String value1) {
                      return DropdownMenuItem<String>(
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "nunto"),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.ageController,
                    
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Age",
                      labelText: "Age",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: controller.dobController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Date of Birth",
                      labelText: "Date of Birth",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle:
                          TextStyle(fontFamily: "nunto", color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.date_range, color: Colors.black),
                      ),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        if (kDebugMode) {
                          print(pickedDate);
                        } //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        if (kDebugMode) {
                          print(formattedDate);
                        } //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement
                        setState(() {
                          controller.dobController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        if (kDebugMode) {
                          print("Date is not selected");
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                     
                    controller: controller.mobileNumberController,
                    
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(
                        fontFamily: "nunto",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5.0, top: 8.0, bottom: 8.0),
                          child: ElevatedButton(
                            child: Text("Sent Otp"),
                            onPressed: () {
                              controller.forgotPhoneInput(context);
                            },
                          ),
                        ),
                      ),
                      prefixIcon: Container(
                        // color: Colors.grey.withOpacity(0.8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "+91",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // child: Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () async {
                        //         final code = await countryPicker.showPicker(
                        //             context: context);
                        //         setState(() {
                        //           countryCode = code;
                        //         });
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             child: countryCode != null
                        //                 ? countryCode!.flagImage
                        //                 : null,
                        //           ),
                        //           SizedBox(
                        //             width: 10,
                        //           ),
                        //           Container(
                        //             padding: EdgeInsets.symmetric(
                        //                 horizontal: 16, vertical: 6),
                        //             decoration: BoxDecoration(
                        //               color: Colors.blue,
                        //               borderRadius: BorderRadius.circular(5),
                        //             ),
                        //             child: Text(
                        //               countryCode?.dialCode ?? "+1",
                        //               style: TextStyle(color: Colors.white),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.emailController, 
                   
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Email",
                      labelText: "Email",

                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      suffixIcon: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5.0, top: 8.0, bottom: 8.0),
                          child: ElevatedButton(
                            child: Text("Sent Otp"),
                            onPressed: () {
                              controller.forgotEmailInput(context);
                            },
                          ),
                        ),
                      ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      //   borderSide: BorderSide(color: email.value ?Colors.green:Colors.red )
                      // ),
                      // suffixIcon: Icon(Icons.done, color: email.value ?Colors.green:Colors.black ),

                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.email, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    

                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Password",
                      labelText: "Password",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.password, color: Colors.black),
                      ),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.confirmPassowrdController,
                    

                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.password, color: Colors.black),
                      ),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state: controller.currentStep > 1
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep >= 1,
            title: Text("Communication Details",
                style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Religion",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue2,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue2 = newValue1!;
                    });
                  },
                  items: <String>['HINDU', "No Religion"]
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Community",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue5,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue5 = newValue1!;
                    });
                  },
                  items: <String>['Nothing', "No commucation"]
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Mother Tounge",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue6,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue6 = newValue1!;
                    });
                  },
                  items: <String>['Tamil', "English"]
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Caste",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue3,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue3 = newValue1!;
                    });
                  },
                  items: <String>['No_Caste', "BC"]
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Sub-Caste",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue4,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue4 = newValue1!;
                    });
                  },
                  items: <String>[
                    'No_sub_caste'
                  ].map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )),
        Step(
            state: controller.currentStep > 2
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep >= 2,
            title: Text(
              "Address Details",
              style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                            text: "Communcation Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)))),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller2.DoorNoController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Door no",
                    labelText: "Door no",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller2.StreetController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Street",
                    labelText: "Street",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller2.AreaController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Area",
                    labelText: "Area",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "City",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue7,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue7 = newValue1!;
                    });
                  },
                  items: <String>['Chennai', 'Maduari', 'Theni']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "District",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue8,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue8 = newValue1!;
                    });
                  },
                  items: <String>['Chennai', 'Maduari', 'Theni']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "State",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue9,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue9 = newValue1!;
                    });
                  },
                  items: <String>['Tamilnadu', 'Kerala', 'Telangana']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Country",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue10,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue10 = newValue1!;
                    });
                  },
                  items: <String>['India', 'US', 'UAE']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Nationality",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue11,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue11 = newValue1!;
                    });
                  },
                  items: <String>['Indian', 'American', 'United Arab Emirates']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                            text: "Permanent Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)))),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller2.DoorNo1Controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Door no",
                    labelText: "Door no",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller2.Street1Controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Street",
                    labelText: "Street",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller2.Area1Controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Area",
                    labelText: "Area",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "City",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue12,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue12 = newValue1!;
                    });
                  },
                  items: <String>['Chennai', 'Maduari', 'Theni']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "District",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue13,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue13 = newValue1!;
                    });
                  },
                  items: <String>['Chennai', 'Maduari', 'Theni']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "State",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue14,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue14 = newValue1!;
                    });
                  },
                  items: <String>['Tamilnadu', 'Kerala', 'Telangana']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Country",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue15,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue15 = newValue1!;
                    });
                  },
                  items: <String>['India', 'US', 'UAE']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )),

        // ------------

        Step(
            state: controller.currentStep > 3
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep >= 3,
            title: Text("Personal Details",
                style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.HeightController,
                 style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Height",
                    labelText: "Height",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.WeightController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Weight",
                    labelText: "Weight",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                 controller: controller3.HobbiesController,
                 style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Hobbies",
                    labelText: "Hobbies",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Skin Tone",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue17,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue17 = newValue1!;
                    });
                  },
                  items: <String>['Fair', 'Medium', 'Light', 'Dark']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Diet",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue18,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue18 = newValue1!;
                    });
                  },
                  items: <String>['Vegitarian', 'Non-Vegitarian']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Martial Details",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue19,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue19 = newValue1!;
                    });
                  },
                  items: <String>['Single', 'Married', 'Divorce']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.NoChildernController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "No.of Children",
                    labelText: "No.of Children",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.ChildernStatusController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Children Status",
                    labelText: "Children Status",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
              ],
            )),

        Step(
            state: controller.currentStep > 4
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep >= 4,
            title: Text("Carrier & Working Details",
                style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Educational Qualification",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue20,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue20 = newValue1!;
                    });
                  },
                  items: <String>['B.E', 'B.Com', 'B.Sc']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Working in",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue21,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue21 = newValue1!;
                    });
                  },
                  items: <String>['Chennai', 'Maduari', 'Banglore']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller4.WorkingInController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Working as",
                    labelText: "Working as",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller4.CompanydetailsController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Company Details",
                    labelText: "Company Details",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller4.AnnualIcome,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Annual Income",
                    labelText: "Annual Income",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
              ],
            )),

        Step(
            state: controller.currentStep > 5
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep >= 5,
            title: Text("Jathagam Details",
                style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Rasi",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue22,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue22 = newValue1!;
                    });
                  },
                  items: <String>[
                    'Aries',
                    'Taurus',
                    'Gemini',
                    'Cancer',
                    'Leo',
                    'Virgo',
                    'Libra',
                    'Scorpio',
                    'Sagittarius',
                    'Capricorn',
                    'Aquarius',
                    'Pisces'
                  ].map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Natchathiram",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue23,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue23 = newValue1!;
                    });
                  },
                  items: <String>[
                    'Ashwini',
                    'Bharani',
                    'Krittika',
                    'Rohini',
                    'Mrighasira',
                    'Ardra',
                    'Punarvasu',
                    'Pushya',
                    'Ashlesha',
                    'Magha',
                    'Purva Phalguni',
                    'Uttara Phalguni',
                    'Hasta',
                    'Chitra',
                    'Swati',
                    'Vishaka',
                  ].map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Laknam",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue24,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue24 = newValue1!;
                    });
                  },
                  items: <String>[
                    'Ashwini',
                    'Bharani',
                    'Krittika',
                    'Rohini',
                    'Mrighasira',
                    'Ardra',
                    'Punarvasu',
                    'Pushya',
                    'Ashlesha',
                    'Magha',
                    'Purva Phalguni',
                    'Uttara Phalguni',
                    'Hasta',
                    'Chitra',
                    'Swati',
                    'Vishaka',
                  ].map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Gothram",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue25,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue25 = newValue1!;
                    });
                  },
                  items: <String>['Yes', 'No']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Kuladeivam",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue26,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue26 = newValue1!;
                    });
                  },
                  items: <String>['Yes', 'No']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Dosham",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue27,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue27 = newValue1!;
                    });
                  },
                  items: <String>['Yes', 'No']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller5.DoshamController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "If Dosham Yes Details",
                    labelText: "If Dosham Yes Details",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
              ],
            )),

        Step(
            isActive: controller.currentStep >= 6,
            title: Text(
              "Family Details",
              style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                 controller: controller6.FatherNameController,
                 style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Father Name",
                    labelText: "Father Name",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.FatherOccupationController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Father Occupation",
                    labelText: "Father Occupation",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.MotherNameController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Mother Name",
                    labelText: "Mother Name",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.MotherOccupationController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Mother Occupation",
                    labelText: "Mother Occupation",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "No of Brother",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue28,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue28 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "No of Brother Married",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue29,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue29 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "No of Sister",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue30,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue30 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "No of Sister Married",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue31,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue31 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Own Vehicle",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue32,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue32 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Own House",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue33,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue33 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Own Lands",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue34,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue34 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Own Flats",
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue,
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue35,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue35 = newValue1!;
                    });
                  },
                  items: <String>['0', '1']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "nunto"),
                      ),
                    );
                  }).toList(),
                ),
                 SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.ExpectationController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Expectation",
                    labelText: "Expectation",
                    hintStyle: TextStyle(fontFamily: "nunto"),
                    labelStyle: TextStyle(fontFamily: "nunto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Colors.black),
                    ),
                  ),
                ),
              ],
            )),
      ];
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

class next extends StatefulWidget {
  @override
  _nextState createState() => _nextState();
}

class _nextState extends State<next> {
  final controller6 = Get.find<FamilyRegisterController>();
  
  @override
  Widget build(BuildContext context) {
    return controller6.checkInput(context); 
  }
}
