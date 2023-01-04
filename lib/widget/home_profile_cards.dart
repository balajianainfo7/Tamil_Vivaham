import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_font.dart';

import '../models/data_model.dart';

class HomeProfileCard extends GetView{

  String? title;
  List<HomeProfileModel>?dataModel;
  VoidCallback? onViewAllClicked;

  HomeProfileCard({this.title, this.dataModel, this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          _renderHeader(title!, onViewAllClicked!),
          SizedBox(
            height: 12,
          ),
          dataModel!.length == 0 ? Container()
              : _renderList()
        ],
      ),
    );
  }

  Widget _renderHeader(String title, VoidCallback onViewAllClicked) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: AppFont.font,
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
         GestureDetector(
            onTap: () {
              onViewAllClicked();
            },
            child: Text(
                'View all',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _renderList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:dataModel!.length,
        itemBuilder: (BuildContext context, int index) {
          return renderSingleCard(index);
        }
      ),
    );
  }

  Widget renderSingleCard(int index){
    return Container(
        height: 250,
        width: 250,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(width: 250,height: 250,
            child: ClipRRect(
                borderRadius:
                BorderRadius.circular(8),
                child: Image.network(dataModel![index].image!, fit: BoxFit.cover,)),),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                    width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8),),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Name: ${dataModel![index].name}",
                            style: TextStyle(color: AppColors.white, fontSize: 22, fontFamily: AppFont.font),),
                            SizedBox(height: 5,),
                            Text("Age: ${dataModel![index].age}",
                              style: TextStyle(color: AppColors.white, fontSize: 18, fontFamily: AppFont.font),),
                            SizedBox(height: 5,),
                            Text("${dataModel![index].designation}",
                              style: TextStyle(color: AppColors.white, fontSize: 22, fontFamily: AppFont.font),),

                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors:
                                    AppColors.buttonColor),
                                borderRadius: BorderRadius.circular(20),),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              child: Text("View Profile",
                                style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font),),
                            ),
                            ClipRRect(
                                borderRadius:
                                BorderRadius.circular(50),
                                child: SvgPicture.asset(
                                    dataModel![index].isLiked! ? "assets/images/heart_filled.svg" : "assets/images/heart_not_filled.svg",
                                  height: 30,
                                  width: 30,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ),
            )
          ],
        ),
    );
  }

}