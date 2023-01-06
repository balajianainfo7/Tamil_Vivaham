import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimen.dart';
import '../resources/app_font.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: AppDimen.screenPadding,
            vertical: 20),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      // padding: const EdgeInsets.only(right: 8, left: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffdcdcdc)),
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top:14),
                            hintText: "Search for Partner",
                            hintStyle: TextStyle(color: Colors.grey),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            suffix: Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.close,
                                color: Color(0xffb3b3b3),
                                size: 16,
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 3),
                              child: Icon(Icons.search,
                                  color: Colors.grey),
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    // flex: 2,
                      child: Container(
                        // height: 30,
                        // width: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffdcdcdc)),
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.filter_list_rounded,
                              size: 28,
                            ),
                            // if (filterApplied!)
                            //   const CircleAvatar(
                            //     radius: 4,
                            //     backgroundColor: Colors.red,
                            //   )
                          ],
                        ),
                      ),)
                ],
              ),
              SizedBox(height: 20,),
              Text("Search Result",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: AppFont.font,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),),
              SizedBox(height: 20,),
              renderSearchResult(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget renderSearchResult(context){
    return  ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount:controller.homePageData.value.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius:
                    BorderRadius.circular(8),
                    child: Image.network(controller.homePageData.value[index].image!, fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,)),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Colors.black45,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow:   [ BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 20.0,
                          spreadRadius: 10
                      ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: controller.homePageData.value[index].name!,
                                style: TextStyle(color: AppColors.white, fontSize: 24, fontFamily: AppFont.font,
                                    fontWeight: FontWeight.w500,letterSpacing: 1.5)
                              ),
                              TextSpan(
                                text: " (${controller.homePageData.value[index].cusId!})",
                                  style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font)
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(controller.homePageData.value[index].designation!,
                            style: TextStyle(color: AppColors.white, fontSize: 16, fontFamily: AppFont.font)),
                        SizedBox(height: 3,),
                        Text("${controller.homePageData.value[index].age!}, ${controller.homePageData.value[index].heightInch!}",
                            style: TextStyle(color: AppColors.white, fontSize: 16, fontFamily: AppFont.font)),
                        SizedBox(height: 3,),
                        Text(controller.homePageData.value[index].location!,
                            style: TextStyle(color: AppColors.white, fontSize: 16, fontFamily: AppFont.font)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
