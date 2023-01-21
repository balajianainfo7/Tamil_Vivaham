import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/models/all_users_model.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:http/http.dart' as http;

import '../utils/api_config.dart';

class DashboardController extends BaseController{
  var homePageData = <HomeProfileModel> [].obs;
  var itemList = <HomePageDataModel>[].obs;

  var allUserModel = AllUsersModel().obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getAllUsersAPI();
    // setDummyHomeData();
  }

  getAllUsersAPI(){
    http.get(
        RestApiClient().allUsers,
        headers: {
          "x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYmVlMDdjOWQ0MGQ5ZDBlMzI0MzBkIiwiaWF0IjoxNjczNTIyOTU1LCJleHAiOjE2NzM1MjY1NTV9._UniZl3H7F3TUfThTJuyGhLbPXD8_yZOelBe9O6g0oo"
        }).then((value) {
      print("getAllUsersAPI Response: ${value.body}");
      final res = jsonDecode(value.body);
      if(res["success"]== 1){
          allUserModel.value = AllUsersModel.fromJson(res);
      }

      for(int i =0 ;i<allUserModel.value.data!.length; i++){
        String? name = "";
        String? gender = "";
        int? age;
        String? des = "";
        String? address = "";
        String? height = "";
        if(allUserModel.value.data![i].personalDetails != null){
          if(allUserModel.value.data![i].personalDetails?.firstName != null || allUserModel.value.data![i].personalDetails?.lastName != null){
            name = '${allUserModel.value.data![i].personalDetails?.firstName != null ? "${allUserModel.value.data![i].personalDetails?.firstName} " : ""}'
                '${allUserModel.value.data![i].personalDetails?.lastName ?? ""}';
          }
          if(allUserModel.value.data![i].personalDetails?.gender != null){
            gender = allUserModel.value.data![i].personalDetails?.gender;
          }
          if(allUserModel.value.data![i].personalDetails?.dOB != null){
            age = AgeCalculator.age(DateTime.parse(allUserModel.value.data![i].personalDetails?.dOB ?? "")).years;
          }
          if(allUserModel.value.data![i].personalDetails?.height != null){
            height = allUserModel.value.data![i].personalDetails?.height;
          }
        }
        if(allUserModel.value.data![i].carrierAndWorkingDetails != null){
          if(allUserModel.value.data![i].carrierAndWorkingDetails?.workingAs != null){
            des = allUserModel.value.data![i].carrierAndWorkingDetails?.workingAs ?? "";
          }
        }
        if(allUserModel.value.data![i].permanentAddress != null){
          address = '${allUserModel.value.data![i].permanentAddress?.city != null ? "${allUserModel.value.data![i].permanentAddress?.city}, " : ""}'
              '${allUserModel.value.data![i].permanentAddress?.district != null ? "${allUserModel.value.data![i].permanentAddress?.district}, " : ""}'
              '${allUserModel.value.data![i].permanentAddress?.state != null ? "${allUserModel.value.data![i].permanentAddress?.state}" : ""}';
        }
        HomeProfileModel model = HomeProfileModel(
            id: allUserModel.value.data![i].sId,
            userId: allUserModel.value.data![i].userObjId,
            name: name,
            gender: gender,
            image: "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg",
            designation: des,
            location: address,
            cusId: allUserModel.value.data![i].userObjId,
            heightInch: height,
            age: age,
            isLiked: false
        );
        homePageData.value.add(model);
      }
      HomePageDataModel dataModel1 = HomePageDataModel(
          title: "Near by you",
          itemList: homePageData.value
      );
      HomePageDataModel dataModel2 = HomePageDataModel(
          title: "Recently Viewed",
          itemList: homePageData.value
      );
      HomePageDataModel dataModel3 = HomePageDataModel(
          title: "Featured members",
          itemList: homePageData.value
      );
      HomePageDataModel dataModel4 = HomePageDataModel(
          title: "Recommanded members",
          itemList: homePageData.value
      );
      isLoading.value = false;
    });
  }

  
  // setDummyHomeData(){
  //   HomeProfileModel model = HomeProfileModel(
  //     id: 1,
  //     name: "Sita",
  //     image: "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg",
  //     designation: "Doctor",
  //     location: "Madurai, Tamil Nadu",
  //     cusId: "TIRU001",
  //     heightInch: "5\".6",
  //     age: 24,
  //     isLiked: false
  //   );
  //   HomeProfileModel model2 = HomeProfileModel(
  //       id: 2,
  //       name: "Ram",
  //       image: "https://www.dazzlerr.com/API/assets/images/20029/profile/F038F442-86C1-8980-64E8-F1A20FA04371.jpg",
  //       designation: "Engineer",
  //       location: "Chennai, Tamil Nadu",
  //       cusId: "TIRU002",
  //       heightInch: "5\".3",
  //       age: 28,
  //       isLiked: true
  //   );
  //   HomeProfileModel model3 = HomeProfileModel(
  //       id: 3,
  //       name: "Balaji",
  //       image: "https://modelsonly.in/wp-content/uploads/2018/12/1-3-480x580_t.jpeg",
  //       designation: "Doctor",
  //       location: "Madurai, Tamil Nadu",
  //       cusId: "TIRU003",
  //       heightInch: "5\".1",
  //       age: 27,
  //       isLiked: false
  //   );
  //   HomeProfileModel model4 = HomeProfileModel(
  //       id: 4,
  //       name: "Priya",
  //       image: "https://i.pinimg.com/originals/da/3d/ea/da3dea35da177b381059555bff6a7ad8.jpg",
  //       designation: "Software Engineer",
  //       location: "Madurai, Tamil Nadu",
  //       cusId: "TIRU004",
  //       heightInch: "5\".6",
  //       age: 24,
  //       isLiked: true
  //   );
  //   HomeProfileModel model5 = HomeProfileModel(
  //       id: 5,
  //       name: "Siddharth",
  //       image: "https://modelsonly.in/wp-content/uploads/2018/02/3-480x580_t.jpg",
  //       designation: "Architect",
  //       location: "Chennai, Tamil Nadu",
  //       cusId: "TIRU005",
  //       heightInch: "5\".5",
  //       age: 26,
  //       isLiked: false
  //   );
  //   homePageData.value.add(model);
  //   homePageData.value.add(model2);
  //   homePageData.value.add(model3);
  //   homePageData.value.add(model4);
  //   homePageData.value.add(model5);
  //
  //   HomePageDataModel dataModel1 = HomePageDataModel(
  //     title: "Near by you",
  //     itemList: homePageData.value
  //   );
  //   HomePageDataModel dataModel2 = HomePageDataModel(
  //       title: "Recently Viewed",
  //       itemList: homePageData.value
  //   );
  //   HomePageDataModel dataModel3 = HomePageDataModel(
  //       title: "Featured members",
  //       itemList: homePageData.value
  //   );
  //   HomePageDataModel dataModel4 = HomePageDataModel(
  //       title: "Recommanded members",
  //       itemList: homePageData.value
  //   );
  //   itemList.value.add(dataModel1);
  //   itemList.value.add(dataModel2);
  //   itemList.value.add(dataModel3);
  //   itemList.value.add(dataModel4);
  //
  //   Future.delayed(const Duration(seconds: 3)).then((value) {
  //     isLoading.value = false;
  //   });
  //
  // }
}