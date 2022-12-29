
import 'package:flutter/material.dart';
import 'package:thirumanam/Auth/Register_Auth.dart';
import 'package:thirumanam/Auth/Welcome_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thirumanam/Navigation/drawer.dart';

import 'Auth/Home_list_page.dart';
void main() async{
    SharedPreferences.setMockInitialValues({});
   await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
    );
  }
}