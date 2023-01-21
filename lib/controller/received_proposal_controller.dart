import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class ReceiviedProporsalController extends BaseController{
var proposalPageData = <ProposalProfileModel> [].obs;
  var itemList = <ProposalDataModel>[].obs;

  // var receiviedProprosal = receiviedProprosalModel().obs;
   @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    // getAllReceiviedProposalAPI();
    fetchFood();
    // acceptProposal("propsal_id");
    // setDummyHomeData();
  }

Future<List<receiviedProprosalModel>> fetchFood() async {
    final url = RestApiClient().receiviedProposal;
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MTM2MzMzLCJleHAiOjE2NzQxMzk5MzN9.cz4BkREkga93njjhbcqMW_8c3nSwSTMCoEOITUb-1ZI'
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){


      // appPreference.accessToken = body["data"];
        print("balaji");
          }
    print(body);
    
    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList(); 
     return List<receiviedProprosalModel>.from(
        body["data"].map((x) => receiviedProprosalModel.fromJson(x)));   
    
  }


  // getAllReceiviedProposalAPI(){
  //   http.get(
  //       RestApiClient().receiviedProposal,
  //       headers: {
  //         "x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MTE0MTU0LCJleHAiOjE2NzQxMTc3NTR9.PMpDHHA5bufWG3pslgvxdeHCx4ncBbPmfZeYwQ0wQdg"
  //       }).then((value) {
  //     print("getAllUsersAPI Response: ${value.body}");
  //     final res = jsonDecode(value.body);
  //     if(res["success"]== 1){
  //         receiviedProprosal.value = receiviedProprosalModel.fromJson(res);
  //     }

  //     for(int i =0 ;i<receiviedProprosal.value.data!.length; i++){
  //       String? name = "";
  //       String? gender = "";
  //       int? age;
  //       if(receiviedProprosal.value.data![i].requestedBy?.personalDetails != null){
  //         if(receiviedProprosal.value.data![i].requestedBy?.personalDetails?.firstName != null || receiviedProprosal.value.data![i].requestedBy?.personalDetails?.lastName != null){
  //           name = '${receiviedProprosal.value.data![i].requestedBy?.personalDetails?.firstName != null ? "${receiviedProprosal.value.data![i].requestedBy?.personalDetails?.firstName} " : ""}'
  //               '${receiviedProprosal.value.data![i].requestedBy?.personalDetails?.lastName ?? ""}';
  //         }
  //         if(receiviedProprosal.value.data![i].requestedBy?.personalDetails?.gender != null){
  //           gender = receiviedProprosal.value.data![i].requestedBy?.personalDetails?.gender ?? "";
  //         }
  //         if(receiviedProprosal.value.data![i].requestedBy?.personalDetails?.age != null){
  //           age = receiviedProprosal.value.data![i].requestedBy?.personalDetails?.age ?? 0;
  //         }
  //       }
          
  //      ProposalProfileModel model = ProposalProfileModel(
        
  //           id: receiviedProprosal.value.data![i].sId,
  //           name: name,
  //           gender: gender,
  //           image: "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg",
  //           age: age,
  //           );
  //       proposalPageData.value.add(model);
      
      
  //     }
  //     isLoading.value = false;
  // });
  // }

  acceptProposal(id)async {
    final acceptUrl = RestApiClient().acceptProposal;
    print(acceptUrl);

    final response = await http.post(
                        Uri.parse(acceptUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MTM2MzMzLCJleHAiOjE2NzQxMzk5MzN9.cz4BkREkga93njjhbcqMW_8c3nSwSTMCoEOITUb-1ZI",
                        },
                        body: jsonEncode(<String, String>{
                          "propsal_id": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar("Successfully accepted the request", context);
                      Text("success");  
                      }else if(response.statusCode == 400){
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }

                    rejectProposal(id)async {
    final rejectUrl = RestApiClient().rejectProposal;
    print(rejectUrl);

    final response = await http.post(
                        Uri.parse(rejectUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MTM2MzMzLCJleHAiOjE2NzQxMzk5MzN9.cz4BkREkga93njjhbcqMW_8c3nSwSTMCoEOITUb-1ZI",
                        },
                        body: jsonEncode(<String, String>{
                          "propsal_id": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar("Successfully reject the request", context);
                      Text("success");  
                      }else if(response.statusCode == 400){
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }
                    

}