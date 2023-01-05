class HomePageDataModel{
  String? title;
  List<HomeProfileModel>? itemList;

  HomePageDataModel({this.title, this.itemList});
}

class HomeProfileModel {
  int? id;
  String? name;
  String? image;
  String? designation;
  String? location;
  String? cusId;
  String? heightInch;

  int? age;
  bool? isLiked;
  HomeProfileModel({this.id, this.name, this.image = "", this.designation = "", this.age, this.isLiked = false,
  this.location, this.cusId, this.heightInch});
}