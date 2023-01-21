import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';


class ProposalReceived extends GetView {

    TextEditingController SearchController = TextEditingController(text: '');
    final controller = Get.find<ReceiviedProporsalController>();
    List<ProposalProfileModel>? dataModel;
ProposalReceived({this.dataModel});
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
              "Received Proposal - 250 Connections",
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
        child: FutureBuilder<List<receiviedProprosalModel>>(
          future: controller.fetchFood(),
          builder: (context, snapshot){
        if(snapshot.hasData){
          
          var foodList = snapshot.data;
          print(foodList);
          // print(foodList!.length);
          print("foodList");
          return  
          foodList!.length == 0 ? Container(child: Center(child: Text("asd"),),):
          
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
                              padding: const EdgeInsets.only(bottom: 18),
                              child: CircleAvatar(

                      // backgroundColor: Colors.black,
                      radius: 30,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage("https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg"))),
                            ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("${food.name}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text("Age ${food.age.toInt()}", style: TextStyle(fontSize: 13,  fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(convertToAgo(time1), style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.grey),)),
                                ],
                              ),
                          ),
                          
                          SizedBox(width: 50,),
                          InkWell(
                              onTap: (){
                                print(controller.acceptProposal(food.id));
                                // controller.acceptProposal(id: foodList["data"][index]["_id"].toString());
                                // print(controller.allUserModel.value.data![1].personalDetails?.firstName);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                  children: [
                                    Icon(Coolicons.circle_check_outline, size: 30,color: Colors.green,),
                                    SizedBox(height: 5,),
                                    Text("Accept", style: TextStyle(color: Colors.grey, fontSize: 14),)
                                  ],
                                ),
                              ),
                            ),
                          
                          
                     
                          SizedBox(width: 17,),
                          InkWell(
                            onTap: (){
                              print(controller.rejectProposal(food.id));
                              // controller.rejectProposal(id: foodList["data"][index]["_id"].toString());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Icon(Coolicons.off_outline_close, size: 30,color: Colors.grey,),
                                  SizedBox(height: 5,),
                                  Text("Decline",style: TextStyle(color: Colors.grey, fontSize: 14),)
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

  


}