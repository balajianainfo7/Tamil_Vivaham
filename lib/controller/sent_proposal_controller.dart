import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/send_proposal_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class SentProporsalController extends BaseController{

   @override
  void onInit() {
    super.onInit();
    // isLoading.value = true;
    fetchSentProposal();
  }

Future<List<sendProprosalModel>> fetchSentProposal() async {
     final url = RestApiClient().sendProposal;
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
     return List<sendProprosalModel>.from(
        body["data"].map((x) => sendProprosalModel.fromJson(x)));   
}

 withdrawProposal(id)async {
    final withdrawUrl = RestApiClient().withdrawProposal;
    print(withdrawUrl);

    final response = await http.post(
                        Uri.parse(withdrawUrl.toString()),
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
                        // showSuccessSnackBar("Successfully withdraw the request", context);
                      Text("success");  
                      }else if(response.statusCode == 400){
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }
}