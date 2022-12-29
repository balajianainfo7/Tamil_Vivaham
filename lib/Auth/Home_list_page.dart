import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:thirumanam/stories/homepage.dart';
import 'package:thirumanam/stories/storypage.dart';
import 'package:thirumanam/stories/util/story_circles.dart';
import 'package:thirumanam/widget/consttants.dart';
// import 'package:thirumanam/Auth/ss.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF134FAF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, top: 20, bottom: 20, right: 5

                  /// 10.0
                  ),
              child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return StoryCircle(
                  function: _openStory,
                );
              },
            ),
          ),
        ],
      ),
            ),
            Column(children: <Widget>[
              // Max Size
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white.withOpacity(0.9),
                ),
                // alignment: const Alignment (1,1),

                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 25,
                            // top: 2,
                            // bottom: 2,
                            right: 5

                            /// 10.0
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Suggest for you",
                              style: TextStyle(
                                decoration: TextDecoration.overline,
                                decorationStyle: TextDecorationStyle.dotted,
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            /// 20.0

                            //  BoxView()
                          ],
                        ),
                      ),
                    ),
                    
                     Expanded(
                      // height: 1,
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                                   itemCount: 5,
                                   itemBuilder: (BuildContext context, int index){
                         return Column(
                                         children: [
                            Container(
                             margin: EdgeInsets.only(left: 20, top: 20),
                             height: 240,
                             width: 202,
                             child: Stack(
                               children: <Widget>[
                                 Positioned(
                                   bottom: 0,
                                   left: 0,
                                   right: 0,
                                   top: 0,
                                   child: Container(
                                     // height: 300,
                                     decoration: BoxDecoration(
                                       color: Colors.white.withOpacity(0.8),
                                       borderRadius: BorderRadius.circular(29),
                                       boxShadow: [
                                         BoxShadow(
                                           offset: Offset(0, 10),
                                           blurRadius: 33,
                                           color: kShadowColor,
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 ClipRRect(
                                    
                                       
                                       borderRadius: BorderRadius.circular(29),
                                       
                                     
                                   child: Image(image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80")
                                     ,fit: BoxFit.cover,
                                     width: 350,
                                     height: 150,
                                   ),
                                 ),
                                 Positioned(
                                   top: 10,
                                   right: 10,
                                   child: Column(
                                     children: <Widget>[
                                       
                                     IconButton(
                                       icon: Icon( Icons.star),
                                       onPressed: () {
                                         // Navigator.push(
                                         //     context,
                                         //     MaterialPageRoute(
                                         //       builder: (context) => BookmarksPage(),
                                         //     ));
                                       },
                       
                                     ),
                                     ],
                                   ),
                                 ),
                                 Positioned(
                                   top: 165,
                                   
                                   child: Container(
                                     height: 77,
                                     width: 202,
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: <Widget>[
                                         Row(children: [
                                           Padding(
                         padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.heat_pump_rounded),
                                           ),
                                         Padding(
                                           padding: EdgeInsets.only(left: 15),
                                           child: RichText(
                          
                          text: TextSpan(
                            style: TextStyle(color: kBlackColor),
                            children: [
                                  TextSpan(
                                    text: "Balaji, ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,fontSize: 20
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Cancer",
                                    style: TextStyle(
                                      color: kLightBlackColor,fontSize: 18
                                    ),
                                  ),
                            ],
                          ),
                                           ),
                                         ),
                                         
                                         // SizedBox(width: 70,),
                                         
                                         ],),
                                         Spacer(),
                                         // Padding(
                                         //   padding: EdgeInsets.only(left: 24),
                                         //   child: RichText(
                                         //     maxLines: 2,
                                         //     text: TextSpan(
                                         //       style: TextStyle(color: kBlackColor),
                                         //       children: [
                                         //             TextSpan(
                                         //               text: "{food.title}",
                                         //               style: TextStyle(
                                         //                 fontWeight: FontWeight.bold,
                                         //               ),
                                         //             ),
                                         //             TextSpan(
                                         //               text: "{food.author}",
                                         //               style: TextStyle(
                                         //                 color: kLightBlackColor,
                                         //               ),
                                         //             ),
                                         //       ],
                                         //     ),
                                         //   ),
                                         // ),
                                       
                                        Spacer(
                                         
                                        ),
                                        
                                          
                                          Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  // Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //           builder: (context) {
                                  //             return DetailPage(id: food.bookId.toString(),);
                                  //           },
                                  //         ),
                                  //       );
                                      
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(29),
                                        bottomLeft: Radius.circular(29),
                                      ),
                                    ),
                                    child: Text(
                                      "Details",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                            onTap: (){
                              // Navigator.push(
                              //                           context,
                              //                           MaterialPageRoute(
                              //                             builder: (context) {
                              //                               return AuthorPage();
                              //                             },
                              //                           ),
                              //                         );
                                         
                              // requestRide(food.id);
                            }  ,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFF29B6F6),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(29),
                                  bottomRight: Radius.circular(29),
                                ),
                              ),
                              child: Text(
                                "Follow",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                            
                            )
                          ],
                                           ),
                                         
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                          // ReadingListCard(
                          //     image: ,
                          //     title: ,
                          //     auth: "",
                          //     rating: 4.9,
                          //     pressDetails: () {
                                   
                          //     }, pressRead: (){
                          //       GestureDetector(onTap: (){
                          //         Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) {
                          //             return AuthorPage();
                          //           },
                          //         ),
                          //       );
                          //       },);
                                     
                          //     },
                          //   ),
                                           
                                         ],
                                       );
                                   }
                       ),
                     ),
                    
                  ],
                ),
              ),

              // Text("data")
            ]),
          ],
        ),
      ),
    );
  }
}
