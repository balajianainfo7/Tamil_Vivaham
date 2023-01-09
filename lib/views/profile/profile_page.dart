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
                          fillColor: Colors.grey.shade100,
                          filled: true,
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
              // expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Communication Details'),
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
                    child: Column(children: [
                      CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Select Religion',
                              items: const ['HINDU', 'No Religion'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Select Community',
                              items: const ['Nothing', 'No commucation'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Mother Tounge',
                              items: const ['Tamil', 'English'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Caste',
                              items: const ['No_Caste', 'BC'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Sub-Caste',
                              items: const ['No_sub_caste', 'Kammalar'],
                              controller: controller.emailController,
                              
                            ),
                            
                            
                    ],),
                  ),

                  
                ),
                //
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              // expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Address Details'),
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 180),
                          child: Text(
                           "Communcation Address",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),

                         SizedBox(height: 30,),
                             TextFormField(
                    // controller: controller2.DoorNoController,
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
                    // controller: controller2.StreetController,
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
                    // controller: controller2.AreaController,
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
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'City',
                              items: const ['Chennai', 'Maduari'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                             CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'District',
                              items: const ['Chennai', 'Maduari'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                             CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'State',
                              items: const ['Tamilnadu', 'Kerala'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                             CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Country',
                              items: const ['India', 'US'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Nationality',
                              items: const ['Indian', 'American'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                      ],
                    ),
                  ),

                  
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 180),
                          child: Text(
                           "Permanent Address ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30,),
                             TextFormField(
                    // controller: controller2.DoorNoController,
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
                    // controller: controller2.StreetController,
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
                    // controller: controller2.AreaController,
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
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'City',
                              items: const ['Chennai', 'Maduari'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                             CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'District',
                              items: const ['Chennai', 'Maduari'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                             CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'State',
                              items: const ['Tamilnadu', 'Kerala'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                             CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Country',
                              items: const ['India', 'US'],
                              controller: controller.emailController,
                              
                            ),
                      ],
                    ),
                  ),

                  
                ),
                //
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              // expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Personal Details'),
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
                    child: Column(children: [
                      TextFormField(
                  // controller: controller3.HeightController,
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
                  // controller: controller3.WeightController,
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
                //  controller: controller3.HobbiesController,
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
                CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Skin Tone',
                              items: const ['Fair', 'Medium', 'Light', 'Dark'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Diet',
                              items: const ['Vegitarian', 'Non-Vegitarian'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Martial Details',
                              items: const ['Single', 'Married', 'Divorce'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                  // controller: controller3.NoChildernController,
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
                  // controller: controller3.ChildernStatusController,
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

                    ],),
                  ),

                  
                ),
                //
              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              // expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Carrier & Working Details'),
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
                    child: Column(
                      children: [
                         CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Educational Qualification',
                              items: const ['B.E', 'B.Com', 'B.Sc'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Working in',
                              items: const ['Chennai', 'Maduari', 'Banglore'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),

                            TextFormField(
                  // controller: controller4.WorkingInController,
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
                  // controller: controller4.CompanydetailsController,
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
                  // controller: controller4.AnnualIcome,
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
                    ),
                  ),

                  
                ),
                //
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              // expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Jathagam Details'),
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
                    child: Column(children: [
                       
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Rasi',
                              items: const [ 'Aries',
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
                    'Pisces'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Natchathiram',
                              items: const [ 'Ashwini',
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
                    'Vishaka',],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Laknam',
                              items: const ['Ashwini',
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
                    'Vishaka',],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Gothram',
                              items: const ['Yes', 'No'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Kuladeivam',
                              items: const ['Yes', 'No'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Dosham',
                              items: const ['Yes', 'No'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                  // controller: controller5.DoshamController,
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
                    ],),
                  ),

                  
                ),
                //
              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              // expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Family Details'),
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
                    child: Column(
                      children:[
                         TextFormField(
                //  controller: controller6.FatherNameController,
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
                  // controller: controller6.FatherOccupationController,
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
                  // controller: controller6.MotherNameController,
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
                  // controller: controller6.MotherOccupationController,
                  
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

                CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter No of Brother',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter No of Brother Married',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter No of Sister',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter No of Sister Married',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Own Vehicle',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Own House',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Own Lands',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),
                            CustomDropdown(
                              
                              fillColor: Colors.grey.withOpacity(0.2),
                              // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                              hintText: 'Enter Own Flats',
                              items: const ['0', '1'],
                              controller: controller.emailController,
                              
                            ),
                            SizedBox(height: 30,),

                            TextFormField(
                  // controller: controller6.ExpectationController,
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
            top: screenHeight * (4 / 9) - 60 / 2,
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