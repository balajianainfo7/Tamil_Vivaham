import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';

import '../../resources/app_routes.dart';


class JathagamUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController RasiController = TextEditingController(text: '');
  TextEditingController NatchathiramController = TextEditingController(text: '');
  TextEditingController LaknamController = TextEditingController(text: '');
  TextEditingController GothramController = TextEditingController(text: '');
  TextEditingController KuladeivamController = TextEditingController(text: '');
  TextEditingController DoshamController = TextEditingController(text: '');
  TextEditingController DoshamDetailsController = TextEditingController(text: '');
 
  checkInput(context){
  if(RasiController.text.isEmpty){
    showSnackBar("Enter Rasi Details", context);
  }else if(NatchathiramController.text.isEmpty){
    showSnackBar("Enter Natchathiram Details", context);
  }else if(LaknamController.text.isEmpty){
    showSnackBar("Enter Laknam Details", context);
  }else if(GothramController.text.isEmpty){
    showSnackBar("Enter Gothram Details", context);
  }else if(KuladeivamController.text.isEmpty){
    showSnackBar("Enter Kuladeivam Details", context);
  }else if(DoshamController.text.isEmpty){
    showSnackBar("Enter Dosham", context);
  }else if(DoshamDetailsController.text.isEmpty){
    showSnackBar("Enter Dosham Details", context);
  }else{
      print("objecaaat");
      print(JathagamUpdateControllerRegisterAPI(context));
      JathagamUpdateControllerRegisterAPI(context);
      // registerAPI(context);
  }
  
}

JathagamUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYmVlMDdjOWQ0MGQ5ZDBlMzI0MzBkIiwiaWF0IjoxNjczMzQ1NzA2LCJleHAiOjE2NzMzNDkzMDZ9.OR-AVIkZbQp3_Z4aSNWNVR3JarHozjifFT39b6ZdW-8"};
  final params = {"rasi": RasiController.text, "natchathiram": NatchathiramController.text, "laknam": LaknamController.text, "gothram": GothramController.text, "kuladeivam":KuladeivamController.text
  ,"dosham": DoshamController.text, "dosham_details": DoshamDetailsController.text,};
  
  print("Jathagam Address API Params: ${params}");
  http.post(
      RestApiClient().jathagamEdit,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Jathagam Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          showSuccessSnackBar("Jathagam Details Updated Succesfully", context);
        Get.toNamed(RouteNames.profile);
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}