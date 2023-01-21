import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class PostFeedController extends BaseController{
  
TextEditingController contentController = TextEditingController(text: '');
String title = "AnAinfo";
final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList = [];

TextEditingController imageController = TextEditingController(text: '');
TextEditingController imageTypeController = TextEditingController(text: '');
TextEditingController imageFormatController = TextEditingController(text: '');
checkInput(context){
  PostFeedAPI(context);  
}

PostFeedAPI(context) async {
  List<Map> carOptionJson = [];
CarJson carJson = new CarJson(_imageFileList.toString(), "IMAGE", "jpg");
carOptionJson.add(carJson.TojsonData());

  final params = {"title": "Harry Potter", "content":"one of the best movie", "attachements":[{'attachement_url': "https://c4.wallpaperflare.com/wallpaper/808/87/756/son-goku-dragon-ball-ultra-instinct-dragon-ball-super-white-hair-hd-wallpaper-preview.jpg", "attachement_type":"IMAGE", "attachement_format":".jpg"}]};
  
  final headers = <String, String>{"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MjIxNjMxLCJleHAiOjE2NzQyMjUyMzF9.WSRveLpEDqjlNXLcmjva1npqdNXA6ulaQKCdaHcrSkE", 'Content-type': 'application/json; charset=UTF-8',};
  print("Verify Otp API Params: ${params}");
  http.post(
      RestApiClient().postStory,
      body: jsonEncode({"title": "Harry Potter11", "content":contentController.text,
          "attachements":carOptionJson        
      }), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Verify Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
          // appPreference.accessToken = res["data"];
          // Get.toNamed(RouteNames.changePassword);
          showSuccessSnackBar("Otp Verified Succesfully", context);
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });
 

}

   void selectedImages() async{
    final List<XFile>? selectedImages = await _picker.pickMultiImage(
      
    );
    if(selectedImages!.isNotEmpty){
      print(selectedImages);
    _imageFileList!.addAll(selectedImages);
    
    
    }
    
    print("Image List Length: "+ _imageFileList!.length.toString());
  }

  

}


class CarJson {
  String aUrl, aType, aformat;
  CarJson(this.aUrl,this.aType,this.aformat );
  Map<String, dynamic> TojsonData() {
    var map = new Map<String, dynamic>();
    map["attachement_url"] = aUrl;
    map["attachement_type"] = aType;
    map["attachement_format"] = aformat;
    return map;
  }
}

