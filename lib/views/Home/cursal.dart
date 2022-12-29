import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
 
class CustomIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomIndicatorState();
  }
}
 
class CustomIndicatorState extends State<CustomIndicator> {
 
  int currentPos = 0;
  List<String> listPaths = [
    "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
    "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
    "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
    "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
    "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
    "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: listPaths.length,
              options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  }
              ),
              itemBuilder: (context, index, realIndex) => MyImageView(listPaths[index]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listPaths.map((url) {
                int index = listPaths.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPos == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ]
        )
      ),
    );
  }
}
 
class MyImageView extends StatelessWidget{
 
  String imgPath;
 
  MyImageView(this.imgPath);
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image(image: NetworkImage(imgPath))
              ),
            ),
          ],
        )
    );
  }
 
}