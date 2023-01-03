class HomePageModel {
  int? id;
  String? name;
  String? image;
  String? designation;
  int? age;
  bool? isLiked;
  HomePageModel({this.id, this.name, this.image = "", this.designation = "", this.age, this.isLiked = false});
}