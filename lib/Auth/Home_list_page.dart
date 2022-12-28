import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
// import 'package:thirumanam/Auth/ss.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {


    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF134FAF),
      body: SingleChildScrollView(

        child: Column(
              children: <Widget> [
          


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
          Text("Top Authors", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),  /// 20.0
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

            

        

          
                Column(
                  
                  children: <Widget> [
                    // Max Size
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        
                        color: Colors.white.withOpacity(1),
                        

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
          Text("For You", style: TextStyle(decoration: TextDecoration.overline,decorationStyle: TextDecorationStyle.dotted,fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,),),  /// 20.0
         
            //  BoxView()
        ],
      ),
      
    ),),

                
                       Container(
                        child: Flexible(
                          child: Stack(children: [
        Positioned(
        
          top: 50,
          left: 40,
          width: 250,
          height: 250,
          child: Container(

            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"), 
              fit: BoxFit.fill),
              
              borderRadius: BorderRadius.circular(28),
            ),
            
          )),

          Positioned(
        
          top: 240,
          left: 55,
          width: 220,
          height: 150,
          child: Container(
            child: Column(children: [
                Text("data", style: TextStyle(decoration: TextDecoration.none),),
              ElevatedButton(onPressed: (){}, child: Text("data"))
            ],),
            decoration: BoxDecoration(
              color: Colors.white,
              
              borderRadius: BorderRadius.circular(28),
            ),
            
          ))
      ],),
                        ),
                       )
                        
                       
                             ],
                          ),
                          
                          
                        ),


                          // Text("data")
                    



               ]
                    ),

                   ],
                ),
        
        
        
            
           
          
      ),
    );
  }
}
