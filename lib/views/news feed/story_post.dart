
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/controller/post_feed_controller.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/utils/api_config.dart';

class StroyPost extends StatefulWidget {
  @override
  State<StroyPost> createState() => StroyPostState();
}

class StroyPostState extends State<StroyPost> {

final controller = Get.find<PostFeedController>();
TextEditingController imageController = TextEditingController(text: '');


XFile? image;

   int numberOfLikes = 10;

  int pageIndex = 0;

  void _onAlertPress() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/one.png',
                      width: 50,
                    ),
                    Text('Gallery'),
                  ],
                ),
                onPressed: getGalleryImage,
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/one.png',
                      width: 50,
                    ),
                    Text('Take Photo'),
                  ],
                ),
                onPressed: getCameraImage,
              ),
            ],
          );
        });
  }

  Future getCameraImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? _image =
        await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      image = _image;
      Navigator.pop(context);
    });
  }

  //============================== Image from gallery
  Future getGalleryImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? _image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = _image;
      Navigator.pop(context);
    });
  }

  Future<Map<String, dynamic>?> _uploadImage(XFile image) async {
    
    

    final mimeTypeData =
        lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');

    // Intilize the multipart request
    final imageUploadRequest = http.MultipartRequest('POST', RestApiClient().postStory);

    // Attach the file in the request
    final file = await http.MultipartFile.fromPath('file', image.path);
    print(file);
    // Explicitly pass the extension of the image with request body
    // Since image_picker has some bugs due which it mixes up
    // image extension with file name like this filenamejpge
    // Which creates some problem at the server side to manage
    // or verify the file extension

//    imageUploadRequest.fields['ext'] = mimeTypeData[1];

    imageUploadRequest.files.add(file);
    print(file);
    imageUploadRequest.headers['Content-type'] = 'application/json';
    imageUploadRequest.headers['Accept'] = 'application/json';
    imageUploadRequest.headers['x-access-token'] =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYzAzYjMzMTA1NTkxOGZhNTRlMDQzIiwiaWF0IjoxNjc0NDYzODYyLCJleHAiOjE2NzQ0Njc0NjJ9._0EMy8GFoYx3GUuFjo_5AxKSetlhd9M7iOR4rTm2vYk';

    imageUploadRequest.fields['title'] = "AnAinfo";
    imageUploadRequest.fields['content'] = imageController.text;
    imageUploadRequest.fields['file'] = image.toString();

    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        return null;
      }
      print(imageUploadRequest);
      print(streamedResponse);
      print(response.body);
      final Map<String, dynamic> responseData = json.decode(response.body);
      _resetState();
      return responseData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _startUploading() async {
    if (image != XFile ||
        imageController.text != '') {
      final Map<String, dynamic>? response = await _uploadImage(image!);

      // Check if any error occured
      if (response == null) {
        showSuccessSnackBar("Post added successfully", context);
      }
    } else {
      showSuccessSnackBar('Please Select a photo/content', context);
    }
  }

  void _resetState() {
    setState(() {
       imageController.text;
      
    });
  }

  hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
  showSuccessSnackBar(String msg, context) {
    hideSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.green,
      content: Text(
        msg,
        style: const TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.normal),
      ),
    ));
  }

   

  List<Widget> _demo = [
    Container(
       decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
      height: 100, width: 100, child: Image(image: NetworkImage("https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),),
    Container(
       decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
      height: 100, width: 100, child: Image(image: NetworkImage("https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),),
    Container(
       decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
      height: 100, width: 100, child: Image(image: NetworkImage("https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),),
    Container(
       decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
      height: 100, width: 100, child: Image(image: NetworkImage("https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4909.jpg?w=740&t=st=1674053514~exp=1674054114~hmac=85d2834dbc328dd5a71b3e2b18cf10c698d59f134867fcbe4b64ac8c0f7412d5")),),
  ];

  // late File _image;

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second ago';
    } else {
      return 'just now';
    }
  }

  DateTime time1 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 4 / 7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.blue],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.9),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white.withOpacity(0.9)),
          ),
          Positioned(
            top: 20,
            left: 5,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Text(
                  "Post Story",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 10, right: 20),
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 40,
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg")),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          width: 80,
                          child: TextField(
                            controller: imageController,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Raleway"),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 3)),
                              filled: true,
                              fillColor: Colors.blue,
                              hintText: "What\'s on your mind?",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: "Raleway"),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.white)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.white,
                  // thickness: 0.5,
                ),
                // SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 55,),
                        InkWell(
                          onTap: (){
                            
                            _onAlertPress();
                            
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_camera_back_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Photo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        InkWell(
                          onTap: (){
                            _startUploading();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: Text(
                              "post",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Raleway",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // GridView.builder(
                    //   itemCount: controller._imageFileList.toString().length,
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (BuildContext context, int index){
                      
                    //   return Image.file(File(controller._imageFileList!));
                    // })
                  ],
                ),
              ],
            ),
          ),

          // Positioned(
          //   top: 135,
          //   left: 20,
          //   child: Container(
          //     height: 100,
          //     width: MediaQuery.of(context).size.width,
          //     child: Text("dd"),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              // child: FutureBuilder<Map<String, dynamic>>(
              //   future: controller.fetchFood(),
              //   builder: (context, snapshot){
              // if(snapshot.hasData){

              //   var foodList = snapshot.data;
              //   print(foodList);
              //   print("foodList");
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 50,
                        shadowColor: Colors.white,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: SizedBox(
                          width: 380,
                          height: 500,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(
                                              "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg")),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20, left: 5, right: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 85),
                                            child: Text("Balaji", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                            SizedBox(height: 7,),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 38),
                                            child: Text(convertToAgo(time1), style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 80,),
                                   Padding(
                                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                               
                                                child: Row(
                                                  children: [
                                                    Icon(Coolicons.plus, size: 20,color: Colors.blue,),
                                                    SizedBox(width: 5,),
                                                    Text("save", style: TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.bold, fontFamily: "Raleway",),)
                                                  ],
                                                ),
                                              ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
          height: 300,
          width: 320,
          child: PageView(
            children: _demo,
            
            onPageChanged: (index){
                setState(() {
                  pageIndex=index;
                });
            },
          ),
        ),
        SizedBox(height: 5,),
        CarouselIndicator(
          color: Colors.blue,
          activeColor: Colors.black,
          count: _demo.length,
          index: pageIndex,
        ),
        SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.only(top:5),
          child: Divider(
            thickness: 0.7,
            color: Colors.grey,
          ),
        ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, top:10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: LikeButton(
                          size: 30,
                          likeCount: numberOfLikes,
                          countPostion: CountPostion.right,
                          
                          likeBuilder: (isTapped){
                            return Icon(Icons.thumb_up_alt_rounded,
                            color: isTapped ? Colors.blue : Colors.grey,
                            size: 30,
                            );
                          },
                      
                        ),
                      ),
                    ),
                    SizedBox(width: 210,),
                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Text("Balaji & other", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway",color: Colors.grey ),),
                    ) 
                  ],
                )
          
                            ],
                          ),
                        ),
                      ),
                      
                    );
                    
                   
                  }),
              // }else{
              //   return Center();
              // }
              //   }

              // )),
            ),
          ),
        ],
      ),
    );
  }
  
}
