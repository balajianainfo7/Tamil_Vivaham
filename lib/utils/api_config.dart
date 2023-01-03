import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:http/http.dart' as http;
import '../views/auth/register_page.dart';
import 'constants.dart';

class RestApiClient {
  
  var dio1 = Dio();
  late Dio dioForLogout;
  final AppPreference appPreference = Get.put(AppPreference());
  RestApiClient() {
    dioForLogout =
        Dio(BaseOptions(connectTimeout: 5000, receiveTimeout: 3000, headers: {
          "Cache-Control": "no-cache",
          "Content-Type": "application/json",
          "authorization": 'Bearer ${appPreference.accessToken}'
        }));
  }

  Dio dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "Cache-Control": "no-cache",
        "Content-Type": "application/json"
      }));

  // static String login = "${URL}login";

  login(String Idcard, String password) async {
    print(Idcard);
    print(password);
    final response = await http.post(
      Uri.parse("http://192.168.1.6:4000/users/userLogin"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Idcard": Idcard,
        "password": password,
      }),
    );

    print(response.body);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print("object");
      print(data);
      
      loginToast("Login Sucessfull");
    } else if (response.statusCode == 400) {
      loginToast("Email or password is not correct");
    } else {
      loginToast("Login Failed");
    }
  }

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor:
            toast == "Login Sucessfull" ? Colors.green : Colors.red,
        textColor: Colors.white);
  }
}