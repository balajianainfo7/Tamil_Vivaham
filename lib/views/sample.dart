// import 'dart:convert';

// import 'package:dio/dio.dart' as Dio;
// import 'package:flutter/material.dart';
// import 'package:flutter_rest_api_image_upload/models/gallery.dart';
// import 'package:flutter_rest_api_image_upload/services/gallery_service.dart';
// import 'package:flutter_rest_api_image_upload/services/profile_service.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';


// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddGalleryScreen extends StatefulWidget {
//   @override
//   _AddGalleryScreenState createState() => _AddGalleryScreenState();
// }

// class _AddGalleryScreenState extends State<AddGalleryScreen> {
//   ScrollController _scrollController = new ScrollController();
//   final galleryController = Get.put(GalleryController());

//   @override
//   void initState() {
//     // TODO: implement initState
//     galleryController.clearController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final node = FocusScope.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Gallery'),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           controller: _scrollController,
//           padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: Form(
//             key: galleryController.formKey,
//             autovalidateMode: AutovalidateMode.disabled,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // GetBuilder<ProfileController>(
//                 //   builder: (_c) => Container(
//                 //     decoration: BoxDecoration(
//                 //       boxShadow: <BoxShadow>[
//                 //         BoxShadow(
//                 //           color: Colors.grey.withOpacity(0.3),
//                 //           blurRadius: 40,
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     child: SizedBox(
//                 //       height: 115,
//                 //       width: 115,
//                 //       child: Stack(
//                 //         clipBehavior: Clip.none, fit: StackFit.expand,
//                 //         children: [
//                 //           CircleAvatar(
//                 //             backgroundImage: profileController.pickedFile!=null
//                 //                 ? FileImage(
//                 //               File(profileController.pickedFile!.path),
//                 //               // height: 300.0,
//                 //               // fit: BoxFit.scaleDown,
//                 //             )
//                 //                 : AssetImage('assets/images/no_user.jpg') as ImageProvider,
//                 //           ),
//                 //           Positioned(
//                 //             right: -16,
//                 //             bottom: 0,
//                 //             child: SizedBox(
//                 //               height: 46,
//                 //               width: 46,
//                 //               child: FlatButton(
//                 //                 shape: RoundedRectangleBorder(
//                 //                   borderRadius: BorderRadius.circular(50),
//                 //                   side: BorderSide(color: Colors.white),
//                 //                 ),
//                 //                 color: Colors.grey[200],
//                 //                 onPressed: () {
//                 //                   Get.bottomSheet(
//                 //                     Container(
//                 //                       decoration: BoxDecoration(
//                 //                         color: Colors.white,
//                 //                         borderRadius: const BorderRadius.only(
//                 //                             topLeft: Radius.circular(16.0),
//                 //                             topRight: Radius.circular(16.0)),
//                 //                       ),
//                 //                       child: Wrap(
//                 //                         alignment: WrapAlignment.end,
//                 //                         crossAxisAlignment: WrapCrossAlignment.end,
//                 //                         children: [
//                 //                           ListTile(
//                 //                             leading: Icon(Icons.camera),
//                 //                             title: Text('Camera'),
//                 //                             onTap: () {
//                 //                               profileController.selectImage(ImageSource.camera);
//                 //                             },
//                 //                           ),
//                 //                           ListTile(
//                 //                             leading: Icon(Icons.image),
//                 //                             title: Text('Gallery'),
//                 //                             onTap: () {
//                 //                               profileController.selectImage(ImageSource.gallery);
//                 //                             },
//                 //                           ),
//                 //                         ],
//                 //                       ),
//                 //                     ),
//                 //                   );
//                 //                 },
//                 //                 child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
//                 //               ),
//                 //             ),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // SizedBox(height: 40),
//                 TextFormField(
//                   keyboardType: TextInputType.name,
//                   controller: galleryController.name,
//                   onEditingComplete: () => node.nextFocus(),
//                   validator: (String? value) {
//                     if (value!.isEmpty) {
//                       return 'Enter your last name';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: "Name",
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 InkWell(
//                   onTap: () {
//                     galleryController.selectImage();
//                   },
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     height: 40,
//                     width: 125,
//                     child: Center(
//                       child: Text(
//                         'Add Image',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 GetBuilder<GalleryController>(
//                   builder: (_c) => GridView.builder(
//                       controller: _scrollController,
//                       shrinkWrap: true,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10),
//                       itemCount: galleryController.pickedFile.length,
//                       itemBuilder: (BuildContext ctx, index) {
//                         return Image(
//                             image: FileImage(
//                           File(galleryController.pickedFile[index].path),
//                         ),
//                           fit: BoxFit.cover,
//                         );
//                       }),
//                 ),
//                 SizedBox(height: 40),
//                 Obx(() {
//                   if (galleryController.isLoading.value)
//                     return LoadingButton(
//                       onClick: () async {},
//                       color: Colors.blue,
//                       childWidget: Center(
//                         child: CircularProgressIndicator(
//                           backgroundColor: Colors.white,
//                         ),
//                       ),
//                     );
//                   else
//                     return LoadingButton(
//                       onClick: () async {
//                         galleryController.create();
//                       },
//                       color: Colors.blue,
//                       childWidget: Center(
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Continue',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                     );
//                 }),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// class GalleryController extends GetxController {
//   TextEditingController name = new TextEditingController();
//   List<XFile> pickedFile = [];
//   var isLoading = false.obs;
//   final formKey = GlobalKey<FormState>();
//   List<Gallery> galleries = List<Gallery>.empty(growable: true).obs;

//   void selectImage() async {
//     try {
//       pickedFile = (await ImagePicker().pickMultiImage())!;
//     } finally {
//       if (Get.isBottomSheetOpen ?? true) Get.back();
//       update();
//     }
//   }

//   void create() async {
//     try {
//       isLoading(true);
//       if (formKey.currentState!.validate()) {
//         var arr = [];
//         for (var img in pickedFile) {
//           arr.add(await Dio.MultipartFile.fromFile(img.path,
//               filename: img.path.split('/').last));
//         }
//         Dio.FormData formData = new Dio.FormData.fromMap({
//           "name": name.text,
//           "images": arr
//         });

//         bool result = await GalleryServices.create(formData);
//         if (result) clearController();
//       }
//     } catch (e) {} finally {
//       isLoading(false);
//     }
//   }

//   void fetch() async {
//     try {
//       isLoading(true);
//       var _data = await GalleryServices.fetch();
//       if (_data != null) {
//         galleries.assignAll(galleryFromJson(jsonEncode(_data)));
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void clearController() {
//     name.clear();
//     pickedFile.clear();
//     update();
//   }
// }