import 'package:flutter/material.dart';

class DashboradPage extends StatelessWidget {
  const DashboradPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      appBar: AppBar(
              leading: Icon(
                Icons.menu
              ),
        backgroundColor: Color(0xfffbb448),
        title: Text("Find your match"),
      ),
    );
  }
}
