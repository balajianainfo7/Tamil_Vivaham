import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/sent_proposal_controller.dart';
import 'package:thirumanam/models/send_proposal_model.dart';
import 'package:thirumanam/resources/app_colors.dart';

class SendReceived extends StatelessWidget {

    TextEditingController SearchController = TextEditingController(text: '');
final controller = Get.find<SentProporsalController>();
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
              "Send Proposal - 250 Connections",
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
                hintText: 'Search Proposal',
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
              child: FutureBuilder<List<sendProprosalModel>>(
          future: controller.fetchSentProposal(),
          builder: (context, snapshot){
        if(snapshot.hasData){
          
          var foodList = snapshot.data;
          print(foodList);
          // print(foodList!.length);
          print("foodList");
          return  
          foodList!.length == 0 ? Container(child: Center(child: Text("You didn't sent any request", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),):
          
          
        ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (BuildContext context, int index){
            var food = foodList[index];
              
              print(foodList);
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
                        backgroundImage: NetworkImage("https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo"))),
                            ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: 22, left: 12),
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
                          
                          SizedBox(width: 58,),
                          InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: InkWell(
                                          onTap: () {
                                             print(controller.withdrawProposal(food.id));
                                            // controller.checkInput(context);
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 30,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
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
                                              'Withdraw',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                                            ),
                                          ),
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

  



}