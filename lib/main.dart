
import 'package:flutter/material.dart';
// import 'package:thirumanam/Auth/BottomNav.dart';
import 'package:thirumanam/Auth/Home_list_page.dart';
import 'package:thirumanam/Auth/Login_Auth.dart';
import 'package:thirumanam/Auth/Register_Auth.dart';
import 'package:thirumanam/Auth/Welcome_auth.dart';
// import 'package:thirumanam/Auth/cursal.dart';
// import 'package:thirumanam/Auth/drawer.dart';
// import 'package:thirumanam/Auth/ss.dart';
import 'package:thirumanam/Home/Home_page.dart';
import 'package:thirumanam/stories/homepage.dart';
import 'package:thirumanam/widget/quardentic_curve.dart';

import 'Otp Auth/otp.dart';

void main() {
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
      home: StoryHomePage(),
    );
  }
}