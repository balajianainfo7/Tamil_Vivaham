import 'dart:async';

import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:thirumanam/models/wishList_model.dart';
import 'package:thirumanam/widget/search_recevied.dart';


class WishListReceived extends StatefulWidget {
   @override
  WishListReceivedState createState() => WishListReceivedState();
}

class WishListReceivedState extends State<WishListReceived> {
  List<wishListProprosalModel> books = [];
  String query = '';
  Timer? debouncer;
    TextEditingController SearchController = TextEditingController(text: '');
    final controller = Get.find<WishListController>();
    List<ProposalProfileModel>? dataModel;
  String convertToAgo(DateTime input){
  Duration diff = DateTime.now().difference(input);
  
  if(diff.inDays >= 1){
    return '${diff.inDays} day(s) ago';
  } else if(diff.inHours >= 1){
    return '${diff.inHours} hour(s) ago';
  } else if(diff.inMinutes >= 1){
    return '${diff.inMinutes} minute(s) ago';
  } else if (diff.inSeconds >= 1){
    return '${diff.inSeconds} second(s) ago';
  } else {
    return 'just now';
  }
}

 @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await controller.fetchWishListProposal(query);

    setState(() => this.books = books);
  }

DateTime time1 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*4/7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.blue],
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4.7),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white.withOpacity(0.9)
            ),
          ),
          Positioned(
            top: 20,
            left: 5,
            child: Row(
              children: [
                IconButton(
                  onPressed:()=> Navigator.pop(context),
                              icon: Icon(Icons.arrow_back,
                  color: Colors.white,
                  size: 25,),
                ),
                 Text(
              "WishList",
              style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
            ),
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: 20,
            child: Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: TextField(
            controller: SearchController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: SearchController.clear,
                ),
                hintText: 'Search WishList',
                border: InputBorder.none),
          ),
        ),
      )
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
          Positioned(
            top: 150,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
        child: FutureBuilder<List<wishListProprosalModel>>(
          future: controller.fetchWishListProposal(''),
          builder: (context, snapshot){
        if(snapshot.hasData){
          
          var foodList = snapshot.data;
          print(foodList);
          print("foodList");
          return foodList!.length == 0 ? Container(child: Center(child: Text("You didn't add any wishlist", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),): 
          
          ListView.builder(
            itemCount: foodList.length,
            itemBuilder: (BuildContext context, int index){
              var food = foodList[index];
            return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 13, right: 13),
              child: Card(
                   elevation: 50,
          shadowColor: Colors.white,
          color: Colors.white,
          shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
                  child: SizedBox(
                    width: 380,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                      // height: 80,  
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 18, left: 10),
                              child: CircleAvatar(
                      // backgroundColor: Colors.black,
                      radius: 30,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage("https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg"))),
                            ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: 22, left: 11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("${food.name}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text("Age ${food.age.toInt()}", style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold, fontFamily: "Raleway"),)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(convertToAgo(time1), style: TextStyle(fontSize: 13,color: Colors.grey, fontWeight: FontWeight.bold, fontFamily: "Raleway"),)),
                                ],
                              ),
                          ),
                          
                          SizedBox(width: 75,),
                          InkWell(
                              onTap: (){
                                print(controller.removeWishListProposal(food.id));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  children: [
                                    IconButton(onPressed: (){
                                      print(controller.removeWishListProposal(food.id));
                                    }, icon: Image.asset("assets/icons/Romance.png", ),iconSize: 65, )
                                    
                                    
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
            ),
          );
          }); 
        }else{
          return Center();
        }
          }

          
        )),
          )
        ],
      ),
      
    );
    
  }

  
 Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final books = await controller.fetchWishListProposal(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

}