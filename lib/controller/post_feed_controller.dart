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
// checkInput(context){
//   PostFeedAPI(context);  
// }



// PostFeedAPI(context) async {
//   List<Map> carOptionJson = [];
// CarJson carJson = new CarJson(_imageFileList.toString(), "IMAGE", "jpg");
// carOptionJson.add(carJson.TojsonData());

//   final params = {"title": "Harry Potter", "content":"one of the best movie", "attachements":[{'attachement_url': "https://c4.wallpaperflare.com/wallpaper/808/87/756/son-goku-dragon-ball-ultra-instinct-dragon-ball-super-white-hair-hd-wallpaper-preview.jpg", "attachement_type":"IMAGE", "attachement_format":".jpg"}]};
  
//   final headers = <String, String>{"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0MjIxNjMxLCJleHAiOjE2NzQyMjUyMzF9.WSRveLpEDqjlNXLcmjva1npqdNXA6ulaQKCdaHcrSkE", 'Content-type': 'application/x-www-form-urlencoded',};
//   print("Verify Otp API Params: ${params}");

//   Future<Map<String, dynamic>?> _uploadImage(XFile image) async {
//     setState(() {
//       pr.show();
//     });
//     print(apiUrl);

//     final mimeTypeData =
//         lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');

//     // Intilize the multipart request
//     final imageUploadRequest = http.MultipartRequest('POST', apiUrl);

//     // Attach the file in the request
//     final file = await http.MultipartFile.fromPath('image', image.path);
//     print(file);
//     // Explicitly pass the extension of the image with request body
//     // Since image_picker has some bugs due which it mixes up
//     // image extension with file name like this filenamejpge
//     // Which creates some problem at the server side to manage
//     // or verify the file extension

// //    imageUploadRequest.fields['ext'] = mimeTypeData[1];

//     imageUploadRequest.files.add(file);
//     print(file);
//     imageUploadRequest.headers['Content-type'] = 'application/json';
//     imageUploadRequest.headers['Accept'] = 'application/json';
//     // imageUploadRequest.headers['authorization'] =
//     //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjMwNzIzYTRiNTkyMGI2ZWQ0YTVjOWY5IiwiaWF0IjoxNjYyMjA1NzYwLCJleHAiOjE2NjIyMjM3NjB9.FrYr-8XxiLwujFERdE4ESE7_N-oTSTKqqhcM4xN_8nM';

//     imageUploadRequest.fields['username'] = username;
//     imageUploadRequest.fields['email'] = email;
//     imageUploadRequest.fields['phoneNumber'] = phoneNumber;
//     imageUploadRequest.fields['password'] = password;
//     imageUploadRequest.fields['houseNo'] = houseNo;
//     imageUploadRequest.fields['streetName'] = streetName;
//     imageUploadRequest.fields['city'] = city;
//     imageUploadRequest.fields['landMark'] = landMark;
//     imageUploadRequest.fields['pincode'] = pincode;
//     imageUploadRequest.fields['bikeNumber'] = bikeNumber;
//     imageUploadRequest.fields['bikeName'] = bikeName;
//     imageUploadRequest.fields['image'] = image.toString();

//     try {
//       final streamedResponse = await imageUploadRequest.send();
//       final response = await http.Response.fromStream(streamedResponse);
//       if (response.statusCode != 200) {
//         return null;
//       }
//       print(imageUploadRequest);
//       print(streamedResponse);
//       print(response.body);
//       final Map<String, dynamic> responseData = json.decode(response.body);
//       _resetState();
//       return responseData;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
  
//   http.MultipartRequest("POST", 
//       RestApiClient().postStory,
//       body: jsonEncode({"title": "Harry Potter11", "content":contentController.text,
//           "attachements":carOptionJson        
//       }), headers: headers).then((value) {
//     Map<String,dynamic> res = jsonDecode(value.body);
//     print("Verify Otp Response: ${res.toString()}");
//     if (res != null) {
//       if (res.isNotEmpty && res["status"] != 410) {
//           // appPreference.accessToken = res["data"];
//           // Get.toNamed(RouteNames.changePassword);
//           showSuccessSnackBar("Otp Verified Succesfully", context);
//       }else{
//         showSnackBar(res["message"], context);
        
//       }
//     }
//   });
 

// }

  //  void selectedImages() async{
  //   final List<XFile>? selectedImages = await _picker.pickMultiImage(
      
  //   );
  //   if(selectedImages!.isNotEmpty){
  //     print(selectedImages);
  //   _imageFileList!.addAll(selectedImages);
    
    
  //   }
    
  //   print("Image List Length: "+ _imageFileList!.length.toString());
  // }

  

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

