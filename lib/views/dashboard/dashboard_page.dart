import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thirumanam/controller/dashboard_controller.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_dimen.dart';
import 'package:thirumanam/resources/app_font.dart';
import 'package:thirumanam/widget/home_profile_cards.dart';

class DashboradPage extends StatelessWidget {
  DashboradPage({Key? key}) : super(key: key);

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      appBar: AppBar(
              leading: Icon(
                Icons.menu,
                color: AppColors.white,
              ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors:
                AppColors.buttonColor),
          ),
        ),
        // backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: Text("Find your best partner",
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppDimen.appbarTitle,
              fontFamily: AppFont.font
          ),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 300,
                padding: EdgeInsets.symmetric(horizontal: AppDimen.screenPadding,
                vertical: 20),
                // color: AppColors.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // padding: const EdgeInsets.only(right: 8, left: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffdcdcdc)),
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top:14),
                          hintText: "Search for Partner",
                          hintStyle: TextStyle(color: Colors.grey),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top: 3),
                            child: Icon(Icons.search,
                                color: Colors.grey),
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 16,),
                    Text("Quick search",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: AppFont.font,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                // color: const Color(0xFF121212),
                                borderRadius: BorderRadius.circular(8),
                                  boxShadow:   [ BoxShadow(
                                    color: Color(0xffdcdcdc),
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 1.0,
                                    spreadRadius: 1
                                ),
                                ],
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                  child: Image.asset("assets/images/groom.jpg")),
                            ),
                            SizedBox(height: 10,),
                            Text("Groom", style: TextStyle(fontFamily: AppFont.font, fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                // color: const Color(0xFF121212),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow:   [ BoxShadow(
                                    color: Color(0xffdcdcdc),
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 1.0,
                                    spreadRadius: 1
                                ),
                                ],
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                  child: Image.asset("assets/images/bride.jpg")),
                            ),
                            SizedBox(height: 10,),
                            Text("Bride", style: TextStyle(fontFamily: AppFont.font, fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.w400),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Obx(() => Column(
                children: [

                  controller.isLoading.value ?
                  Container(
                      height: 80,
                      width: 80,
                      alignment: AlignmentDirectional.center,
                      child: Lottie.asset(
                        "assets/loading/heart.json",
                      ))
                      : Column(
                    children: [
                      for(int i = 0; i< controller.itemList.length ;i++)
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: HomeProfileCard(
                            title: controller.itemList[i].title,
                            dataModel: controller.itemList[i].itemList,
                            onViewAllClicked: () => print("onViewAllClicked clicked"),
                          ),
                        )
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
