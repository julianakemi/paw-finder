import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  String type;
  String img;
  String location;
  String breed;
  String size;
  String gender;
  String color;
  String userDocumentId;
  String description;
  Timestamp? createdAt;

  Pet(
      {required this.type,
      required this.img,
      required this.location,
      required this.breed,
      required this.size,
      required this.gender,
      required this.color,
      required this.userDocumentId,
      required this.description,
      this.createdAt});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'img': img,
      'location': location,
      'breed': breed,
      'size': size,
      'gender': gender,
      'color': color,
      'userDocumentId': userDocumentId,
      'description': description,
      'createdAt': createdAt,
    };
  }

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
        type: json["type"],
        img: json["img"],
        location: json["location"],
        breed: json["breed"],
        size: json["size"],
        gender: json["gender"],
        color: json["color"],
        userDocumentId: json["userDocumentId"],
        description: json["description"],
        createdAt: json['createdAt']);
  }
}
