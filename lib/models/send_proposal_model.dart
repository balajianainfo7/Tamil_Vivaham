import 'package:flutter/material.dart';

class sendProprosalModel {
  final String id;
  final String name;
  // final String name;
  final int age;
  
  const sendProprosalModel({
    required this.id,
    required this.name,
    // required this.name,
    required this.age,

    

  });

  factory sendProprosalModel.fromJson(Map<String, dynamic> json) => sendProprosalModel(
       id: json['_id'].toString(),
        name: json['request_for']['customer_obj_id']['personal_details']["first_name"].toString(),
        // name: json['title'].toString(),
        age: json['request_for']['customer_obj_id']['personal_details']["age"],
        
      );
       Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "name": name,
        "age": age
    };
}
