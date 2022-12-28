import 'package:flutter/material.dart';
import 'package:thirumanam/widget/size_config.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
             20,               /// 20.0
            8,              /// 8.0
            20,                /// 20.0
            8,              /// 8.0
        ),
        child: InkWell(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageView1()));
            print("hello");
          },
          child: Container(
            height: 50,          /// 50.0
            width: 385,            /// 385.0
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  color: Colors.black.withOpacity(0.3),
                )
              ]
            ),
            child:Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.search, color: Colors.black26,),
                ),
                Text("Search", style: TextStyle(color: Colors.black26, fontSize: 16))     /// 16
              ],
            )
          ),
        ),
      ),
    );
  }
}
