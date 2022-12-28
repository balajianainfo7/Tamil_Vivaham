import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../widget/size_config.dart';

// String token = "";
class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {


 


 
    
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(

        child: Column(
              children: <Widget> [
          


          Text("data"),
            
            // DiscountCard(),
            // FoodPart(partName: "Categories"),
            // CategoriesFood(),
            Padding(
      padding: EdgeInsets.only(
          left: 25,
          top: 20,
          bottom: 20,
          right:  5
             /// 10.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Top Authors", style: TextStyle(fontSize: SizeConfig.screenHeight!/41.18, color: Colors.white, fontWeight: FontWeight.bold),),  /// 20.0
         ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),primary: Color(0xFF29B6F6),),
                                
                                child: Text(
                                  "See All",
                                  style: TextStyle(fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.w700),
                                ),
                                
                                
                                onPressed: () {
                                
                                }),
             /// 32.0
        ],
      ),
    ),

            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                           
                ],
              ),
            ),

        

          
                Column(
                  
                  children: <Widget> [
                    // Max Size
                    Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        
                        color: Colors.white54.withOpacity(0.8),

                      ),
                      // alignment: const Alignment (1,1),
                      

                      child: Column(
                      children:   [
                       Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Padding(
      padding: EdgeInsets.only(
          left: 25,
          // top: 2,
          // bottom: 2,
          right:  5
             /// 10.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("For You", style: TextStyle(decoration: TextDecoration.overline,decorationStyle: TextDecorationStyle.dotted,fontSize: SizeConfig.screenHeight!/41.18, color: Colors.black, fontWeight: FontWeight.bold,),),  /// 20.0
         
             /// 32.0
        ],
      ),
    ),),

                             ],
                          ),
                        ),



                    



               ]
                    ),

                   ],
                ),
        
        
        
            
           
          
      ),
    );
  }
}
