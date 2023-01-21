import 'package:flutter/material.dart';

class wishListProprosalModel {
  final String id;
  final String name;
  // final String name;
  final int age;
  
  const wishListProprosalModel({
    required this.id,
    required this.name,
    // required this.name,
    required this.age,

    

  });

  factory wishListProprosalModel.fromJson(Map<String, dynamic> json) => wishListProprosalModel(
       id: json['_id'].toString(),
        name: json['wishListed_profile']['customer_obj_id']['personal_details']["first_name"].toString(),
        // name: json['title'].toString(),
        age: json['wishListed_profile']['customer_obj_id']['personal_details']["age"],
        
      );
       Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "name": name,
        "age": age
    };
}
