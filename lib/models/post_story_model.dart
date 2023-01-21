class postStoryModel {
  String? title;
  String? content;
  List<Attachements>? attachements;

  postStoryModel({this.title, this.content, this.attachements});

  postStoryModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    if (json['attachements'] != null) {
      attachements = <Attachements>[];
      json['attachements'].forEach((v) {
        attachements!.add(new Attachements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    if (this.attachements != null) {
      data['attachements'] = this.attachements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachements {
  String? attachementUrl;
  String? attachementType;
  String? attachementFormat;

  Attachements(
      {this.attachementUrl, this.attachementType, this.attachementFormat});

  Attachements.fromJson(Map<String, dynamic> json) {
    attachementUrl = json['attachement_url'];
    attachementType = json['attachement_type'];
    attachementFormat = json['attachement_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attachement_url'] = this.attachementUrl;
    data['attachement_type'] = this.attachementType;
    data['attachement_format'] = this.attachementFormat;
    return data;
  }
}