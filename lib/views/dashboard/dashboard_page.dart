import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thirumanam/controller/dashboard_controller.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_dimen.dart';
import 'package:thirumanam/resources/app_font.dart';

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
        backgroundColor: AppColors.primaryColor,
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

        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: AppDimen.screenPadding,
              vertical: 20),
              // color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Looking for",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: AppDimen.titleHeading,
                      fontFamily: AppFont.font
                    ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          // color: const Color(0xFF121212),
                          borderRadius: BorderRadius.circular(8),
                            boxShadow:   [ BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 10.0,
                              spreadRadius: 1
                          ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(8),
                            child: Image.asset("assets/images/groom.jpg")),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          // color: const Color(0xFF121212),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow:   [ BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 10.0,
                              spreadRadius: 1
                          ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(8),
                            child: Image.asset("assets/images/bride.jpg")),
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
                    : Container()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
