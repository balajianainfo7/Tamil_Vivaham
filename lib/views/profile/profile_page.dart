import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:thirumanam/controller/register_controller.dart';
import 'package:thirumanam/views/profile/commons/my_info.dart';
import 'package:thirumanam/views/profile/commons/opaque_image.dart';
import 'package:thirumanam/views/profile/commons/profile_info_big_card.dart';
import 'package:thirumanam/views/profile/commons/profile_info_card.dart';
import 'package:thirumanam/views/profile/styleguide/colors.dart';
import 'package:thirumanam/views/profile/styleguide/text_style.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import '../../controller/stepper_register_controller.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // final  = TextEditingController();
    final controller = Get.find<RegisterController>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: <Widget>[
                    OpaqueImage(
                      imageUrl: "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Profile",
                                textAlign: TextAlign.left,
                                style: actionMenuStyle,
                              ),
                            ),
                            MyInfo(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(top: 50),
                  color: Colors.white,
                  child: ListView(
                    // scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardA,
              leading: CircleAvatar(child: Text('A')),
              title: Text('Basic Information'),
              subtitle: Text('Edit Preference'),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Form(
                      // key: _key,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: [
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Select Profile For',
                              items: const ['SON', 'DAUGHTER'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              fillColor: Colors.grey.withOpacity(0.2),
                              fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Select UserType',
                              items: const ['CUSTOMER', 'ADMIN'],
                              controller: controller.emailController,
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                        // controller: controller.firstNameController,
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
                        // controller: controller.lastNameController,
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
                        // controller: controller.nickNameController,
                        
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
                                         CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Select Gender',
                              items: const ['MALE', 'FEMALE'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                        // controller: controller.ageController,
                        
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
                        // controller: controller.dobController,
                        // setState(() {
                        //       controller.dobController.text =
                        //           formattedDate; //set output date to TextField value.
                        //     });
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
                              initialDate: DateTime(2018),
                              firstDate: DateTime(
                                  1980), //DateTime.now() - not to allow to choose before today.
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
                            // setState(() {
                            //   controller.dobController.text =
                            //       formattedDate; //set output date to TextField value.
                            // });
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
                         
                        // controller: controller.mobileNumberController,
                        
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
                           
                          ),
                        ),
                                        ),
                                        SizedBox(
                        height: 30,
                                        ),
                                        TextFormField(
                        // controller: controller.emailController, 
                                         
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
                          
                         
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20, right: 15),
                            child: Icon(Icons.email, color: Colors.black),
                          ),
                        ),
                                        ),
                            ElevatedButton(onPressed: (){
                              print(controller.emailController.text);
                              print(controller.emailController.text);
                            }, child: Text("data"))
                                          
                          ],),
                      ),
                    ),
                    ),
                  ),
                
              
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Tap me!'),
              subtitle: Text('I expand, too!'),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                     controller.emailController.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
        ],
      ),
//                   
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * (4 / 9) - 80 / 2,
            left: 16,
            right: 16,
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ProfileInfoCard(firstText: "54%", secondText: "Progress"),
                  SizedBox(
                    width: 10,
                  ),
                  ProfileInfoCard(
                    hasImage: true,
                    imagePath: "assets/icons/pulse.png",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ProfileInfoCard(firstText: "152", secondText: "Level"),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}