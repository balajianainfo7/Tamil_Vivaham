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
    final _key = new GlobalKey<FormState>();
    TextEditingController jobRoleCtrl = TextEditingController();
    TextEditingController jobRoleCtrl1 = TextEditingController();
    
  //   void initState(){
  //     setState(() {
  //     jobRoleCtrl.text = "";
  //     jobRoleCtrl1.text = "";    
  //     });
  //     super.initState();
  //   }
  //   void dispose() {
  //   jobRoleCtrl.dispose();
  //   jobRoleCtrl1.dispose();
  //   // jobRoleSearchDropdownCtrl.dispose();
  //   super.dispose();
  // }
  //   print(jobRoleCtrl.text);
    final controller = Get.find<RegisterController>();
    final screenHeight = MediaQuery.of(context).size.height;
final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
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
                    scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardA,
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
                      key: _key,
                      child: Column(children: [
                          CustomDropdown(
                            
                            fillColor: Colors.grey.withOpacity(0.2),
                            // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                            hintText: 'Select Profile For',
                            items: const ['SON', 'DAUGHTER'],
                            controller: jobRoleCtrl,
                            
                          ),
                          SizedBox(height: 30,),
                          CustomDropdown(
                            fillColor: Colors.grey.withOpacity(0.2),
                            fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                            hintText: 'Select UserType',
                            items: const ['CUSTOMER', 'ADMIN'],
                            controller: jobRoleCtrl1,
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
                            controller: jobRoleCtrl,
                            
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
                            print(jobRoleCtrl.text);
                            print(jobRoleCtrl1.text);
                          }, child: Text("data"))
                                        
                        ],),
                    ),
                    ),
                  ),
                
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.expand();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.toggleExpansion();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardB,
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
                     jobRoleCtrl.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.toggleExpansion();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
//                   child: Table(
//                     children: [
//                       TableRow(
//                         children: [
//                           ExpansionTileCard(
//   baseColor: Colors.cyan[50],
//   expandedColor: Colors.red[50],
//   key: cardA,
//   leading: CircleAvatar(
//       child: Image.asset("assets/images/devs.jpg")),
//   title: Text("Flutter Dev's"),
//   subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
//   children: <Widget>[
//     Divider(
//       thickness: 1.0,
//       height: 1.0,
//     ),
//     Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16.0,
//           vertical: 8.0,
//         ),
//         child: Text(
//           "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
//               " creative and leading-edge flutter app development solutions for customers all around the globe.",
//           style: Theme.of(context)
//               .textTheme
//               .bodyText2!
//               .copyWith(fontSize: 16),
//         ),
//       ),
//     ),
//   ],
// ),

// ExpansionTileCard(
//   baseColor: Colors.cyan[50],
//   expandedColor: Colors.red[50],
//   key: cardA,
//   leading: CircleAvatar(
//       child: Image.asset("assets/images/devs.jpg")),
//   title: Text("Flutter Dev's"),
//   subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
//   children: <Widget>[
//     Divider(
//       thickness: 1.0,
//       height: 1.0,
//     ),
//     Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16.0,
//           vertical: 8.0,
//         ),
//         child: Text(
//           "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
//               " creative and leading-edge flutter app development solutions for customers all around the globe.",
//           style: Theme.of(context)
//               .textTheme
//               .bodyText2!
//               .copyWith(fontSize: 16),
//         ),
//       ),
//     ),
//   ],
// ),
//                           // ProfileInfoBigCard(
//                           //   firstText: "13",
//                           //   secondText: "New matches",
//                           //   icon: Icon(
//                           //     Icons.star,
//                           //     size: 32,
//                           //     color: blueColor,
//                           //   ),
//                           // ),
//                           // ProfileInfoBigCard(
//                           //   firstText: "21",
//                           //   secondText: "Unmatched me",
//                           //   icon: Image.asset(
//                           //     "assets/icons/sad_smiley.png",
//                           //     width: 32,
//                           //     color: blueColor,
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       TableRow(
//                         children: [
//                           ProfileInfoBigCard(
//                             firstText: "264",
//                             secondText: "All matches",
//                             icon: Image.asset(
//                               "assets/icons/checklist.png",
//                               width: 32,
//                               color: blueColor,
//                             ),
//                           ),
//                           ProfileInfoBigCard(
//                             firstText: "42",
//                             secondText: "Rematches",
//                             icon: Icon(
//                               Icons.refresh,
//                               size: 32,
//                               color: blueColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       TableRow(
//                         children: [
//                           ProfileInfoBigCard(
//                             firstText: "404",
//                             secondText: "Profile Visitors",
//                             icon: Icon(
//                               Icons.remove_red_eye,
//                               size: 32,
//                               color: blueColor,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               // Navigator.of(context).push(
//                               //   MaterialPageRoute(
//                               //     builder: (context) => SuperLikesMePage(),
//                               //   ),
//                               // );
//                             },
//                             child: ProfileInfoBigCard(
//                               firstText: "42",
//                               secondText: "Super likes",
//                               icon: Icon(
//                                 Icons.favorite,
//                                 size: 32,
//                                 color: blueColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
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