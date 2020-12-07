import 'dart:convert';

PublisherModel publisherModelFromJson(String str) => PublisherModel.fromJson(json.decode(str));

String publisherModelToJson(PublisherModel data) => json.encode(data.toJson());

class PublisherModel {
  PublisherModel({
    this.publisher,
  });

  List<User> publisher;

  factory PublisherModel.fromJson(Map<String, dynamic> json) => PublisherModel(
    publisher: List<User>.from(json["publisher"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "publisher": List<dynamic>.from(publisher.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.date,
    this.publishNo,
  });

  String date;
  String publishNo;

  factory User.fromJson(Map<String, dynamic> json) => User(
    date: json["date"],
    publishNo: json["publishNo"],
  );

  Map<String, dynamic> toJson() => {
    "id": date,
    "publishNo": publishNo,
  };
}