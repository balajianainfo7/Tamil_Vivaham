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
import '../models/wishList_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class WishListController extends BaseController{

   @override
  void onInit() {
    super.onInit();
    // isLoading.value = true;
    fetchWishListProposal('');
  }

Future<List<wishListProprosalModel>> fetchWishListProposal(String query) async {
     final url = RestApiClient().getallWishlist;
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MjkyOTc1LCJleHAiOjE2NzQyOTY1NzV9.7_tOrZbcQ4RNdRT6C91AjxzyNMhIhcWRemwXsr3dEOE'
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){
        
      // appPreference.accessToken = body["data"];
        print("balaji");
          }
    print(body);
    
    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList(); 
     return List<wishListProprosalModel>.from(
        body["data"].map((x) => wishListProprosalModel.fromJson(x)));   
}

 addWishListProposal(id)async {
    final addWishlistUrl = RestApiClient().addWishlist;
    print(addWishlistUrl);

    final response = await http.post(
                        Uri.parse(addWishlistUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MjkyOTc1LCJleHAiOjE2NzQyOTY1NzV9.7_tOrZbcQ4RNdRT6C91AjxzyNMhIhcWRemwXsr3dEOE",
                        },
                        body: jsonEncode(<String, String>{
                          "wishuserId": id.toString(),
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

                    removeWishListProposal(id)async {
    final removeWishlistUrl = RestApiClient().removeWishlist;
    print(removeWishlistUrl);

    final response = await http.post(
                        Uri.parse(removeWishlistUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MjkyOTc1LCJleHAiOjE2NzQyOTY1NzV9.7_tOrZbcQ4RNdRT6C91AjxzyNMhIhcWRemwXsr3dEOE",
                        },
                        body: jsonEncode(<String, String>{
                          "wishuserId": id.toString(),
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