import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxView extends StatefulWidget {
  const BoxView({Key? key}): super(key: key);

  @override
  State<BoxView> createState() => BoxViewState();
}

class BoxViewState extends State<BoxView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Positioned(
        
          top: 100,
          left: 40,
          width: 250,
          height: 250,
          child: Container(

            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"), 
              fit: BoxFit.fill),
              
              borderRadius: BorderRadius.circular(28),
            ),
            
          )),

          Positioned(
        
          top: 240,
          left: 55,
          width: 220,
          height: 150,
          child: Container(
            child: Column(children: [
                Text("data", style: TextStyle(decoration: TextDecoration.none),),
              ElevatedButton(onPressed: (){}, child: Text("data"))
            ],),
            decoration: BoxDecoration(
              color: Colors.white,
              
              borderRadius: BorderRadius.circular(28),
            ),
            
          ))
      ],),
    );
  }
}