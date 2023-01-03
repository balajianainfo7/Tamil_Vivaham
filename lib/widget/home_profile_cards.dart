import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_colors.dart';

import '../models/data_model.dart';

class HomeProfileCard extends GetView{

  String? title;
  List<HomePageModel>?dataModel;
  VoidCallback? onViewAllClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _renderHeader(title!, onViewAllClicked!),
          SizedBox(
            height: 5,
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
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
         GestureDetector(
            onTap: () {
              onViewAllClicked();
            },
            child: Text(
                'View all',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _renderList() {
    return SizedBox(
      height: 162,
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

    );
  }

}