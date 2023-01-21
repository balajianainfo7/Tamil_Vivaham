import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:coolicons/coolicons.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/controller/post_feed_controller.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

import '../../resources/app_colors.dart';

class DetailedFilter extends StatefulWidget {
  @override
  State<DetailedFilter> createState() => DetailedFilterState();
}

class DetailedFilterState extends State<DetailedFilter> {
  final controller = Get.find<PostFeedController>();

  int numberOfLikes = 10;

  int pageIndex = 0;

  List<Widget> _demo = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 100,
      width: 100,
      child: Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),
    ),
  ];

  // late File _image;

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second ago';
    } else {
      return 'just now';
    }
  }

  DateTime time1 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 4 / 7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.blue],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4.6),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white.withOpacity(0.9)),

          ),
          Positioned(
            top: 20,
            left: 5,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Text(
                  "Add Proposal",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 100,
                          child: TextField(
                            controller: controller.contentController,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Raleway"),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 3)),
                              filled: true,
                              fillColor: Colors.blue,
                              hintText: "Search Proposal",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: "Raleway"),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.white)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                     Text("Sort by:", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.white)),
                     SizedBox(width: 10,),
                     TextButton(onPressed: (){
                      _settingModalBottomSheet(context);
                     }, child: Row(children: [
                      Text("Search by filter", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.white)),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
                     ],),)

                  ],
                ),
             
              ],
            ),
          ),

          // Positioned(
          //   top: 135,
          //   left: 20,
          //   child: Container(
          //     height: 100,
          //     width: MediaQuery.of(context).size.width,
          //     child: Text("dd"),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Container(
              // child: FutureBuilder<Map<String, dynamic>>(
              //   future: controller.fetchFood(),
              //   builder: (context, snapshot){
              // if(snapshot.hasData){

              //   var foodList = snapshot.data;
              //   print(foodList);
              //   print("foodList");
              child: ListView.builder(
                
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 50,
                        shadowColor: Colors.white,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: SizedBox(
                          width: 380,
                          height: 230,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 15, right: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 170,
                                            width: 140,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(29),
                                              child: Image(
                                                image: NetworkImage(
                                                    "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg"),
                                                fit: BoxFit.cover,
                                                width: 140,
                                                height: 170,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6,),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 35),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.verified_rounded, color: Colors.green,),
                                                  SizedBox(width: 6,),
                                                  Text("verified", style: TextStyle(fontSize: 13,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),),      
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                            padding: EdgeInsets.only(top: 5, left: 11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("balaji", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: Row(
                                      children: [
                                        Text("921315114044", style: TextStyle(fontSize: 13,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),),
                                        VerticalDivider(),
                                        Text("Hindu", style: TextStyle(fontSize: 13,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),),
                                      ],
                                    )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: 
                                        Text("27 years, \'5.9\', India", style: TextStyle(fontSize: 13,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),),
                                        
                                      ),
                                      Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: 
                                        Text("Premium Category", style: TextStyle(fontSize: 13,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),),
                                        
                                      ),
                                        Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: 
                                        Text("BE / Flutter / 8,00,000 PA", style: TextStyle(fontSize: 13,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),),
                                        
                                      ),

                                      Padding(
                                    padding: EdgeInsets.only(top: 18),
                                    child: 
                                        Row(
                                          children: [
                                            InkWell(
                                          onTap: () {
                                            
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 35,
                                            
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
                                                        [Colors.blue, Colors.blue])),
                                            child: Text(
                                              'Send Request',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                          SizedBox(width: 8,),
                                         InkWell(
                                          onTap: () {
                                            
                                          },
                                          child: Container(
                                             width: 70,
                                            height: 35,
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
                                                        [Colors.blue, Colors.blue])),
                                            child: Text(
                                              'Chat Now',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),

                                          ],
                                        ),
                                        
                                      ),
                                ],
                              ),
                          ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              // }else{
              //   return Center();
              // }
              //   }

              // )),
            ),
          ),
        ],
      ),
    );
  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
              
              Padding(
            padding: const EdgeInsets.all(12),
            child: ExpansionTileCard(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              
              // key: cardB,
              // expandedTextColor: Colors.red,
              expandedColor: Colors.white.withOpacity(0.9),
              leading: CircleAvatar(child: Icon(CupertinoIcons.heart_circle)),
              
              title: Text('Sort by'),
              
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
                              hintText: 'Select Category',
                              items: const ['Relevance', 'Created Date', 'Premium', 'VIP only'],
                              controller: controller.imageController,
                              
                            ),
                    ],),
                  ),

                  
                ),
                //
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: ExpansionTileCard(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              
              // key: cardB,
              // expandedTextColor: Colors.red,
              expandedColor: Colors.white.withOpacity(0.9),
              leading: CircleAvatar(child: Icon(CupertinoIcons.heart_circle)),
              
              title: Text('Filter'),
              
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text("Age", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Min Age',
                                    items: const ['18', '19', '20', '21','22', '23', '24', '25', '26', '27','28', '29', '30', '31'],
                                    controller: controller.imageController,
                                    
                                  ),
                          ),
                              SizedBox(width: 8,),
                              Text("To", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                              SizedBox(width: 8,),
                                Expanded(
                                  child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Max Age',
                                    items: const ['18', '19', '20', '21','22', '23', '24', '25', '26', '27','28', '29', '30', '31'],
                                    controller: controller.imageController,
                                    
                                  ),
                                ),
                        ],
                      ),
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text("Salary", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Min Salay',
                                    items: const ['1 Lakhs', '2 Lakhs', '3 Lakhs', '4 Lakhs','5 Lakhs', '6 Lakhs', '7 Lakhs', '8 Lakhs', '9 Lakhs', '10 Lakhs','11 Lakhs', '12 Lakhs', '13 Lakhs', '14 Lakhs'],
                                    controller: controller.imageController,
                                    
                                  ),
                          ),
                              SizedBox(width: 8,),
                              Text("To", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                              SizedBox(width: 8,),
                                Expanded(
                                  child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Max Salary',
                                    items: const ['1 Lakhs', '2 Lakhs', '3 Lakhs', '4 Lakhs','5 Lakhs', '6 Lakhs', '7 Lakhs', '8 Lakhs', '9 Lakhs', '10 Lakhs','11 Lakhs', '12 Lakhs', '13 Lakhs', '14 Lakhs'],
                                    controller: controller.imageController,
                                    
                                  ),
                                ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text("Height", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Min Height',
                                    items: const ['140cm', '145cm', '150cm', '155cm','160cm', '165cm', '170cm', '175cm', '180cm', '185cm','190cm', '195cm', '200cm', '205cm'],
                                    controller: controller.imageController,
                                    
                                  ),
                          ),
                              SizedBox(width: 8,),
                              Text("To", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                              SizedBox(width: 8,),
                                Expanded(
                                  child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Max Height',
                                    items: const ['140cm', '145cm', '150cm', '155cm','160cm', '165cm', '170cm', '175cm', '180cm', '185cm','190cm', '195cm', '200cm', '205cm'],
                                    controller: controller.imageController,
                                    
                                  ),
                                ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text("Weight", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Min Weight',
                                    items: const ['50', '55', '60', '65','70', '75', '80', '85', '90', '95','100', '105', '110', '115'],
                                    controller: controller.imageController,
                                    
                                  ),
                          ),
                              SizedBox(width: 8,),
                              Text("To", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey)),
                              SizedBox(width: 8,),
                                Expanded(
                                  child: CustomDropdown(
                                    
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                    hintText: 'Max Weight',
                                    items: const ['50', '55', '60', '65','70', '75', '80', '85', '90', '95','100', '105', '110', '115'],
                                    controller: controller.imageController,
                                    
                                  ),
                                ),
                        ],
                      ),
                    ],),
                  ),

                  
                ),
                //
              ],
            ),
          ),
            ],
          ),
          );
      }
    );
}
}
