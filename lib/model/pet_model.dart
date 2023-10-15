class PetModel {
  String type;
  String img;
  String location;
  String breed;
  String size;
  String gender;
  String color;
  String description;

  PetModel({
    required this.type,
    required this.img,
    required this.location,
    required this.breed,
    required this.size,
    required this.gender,
    required this.color,
    required this.description,
  });
  factory PetModel.fromJson(Map <String, dynamic> json){
    return PetModel(type: json["type"], img: json["img"], location: json["location"], breed: json["breed"], size: json["size"], gender: json["gender"], color: json["color"], description: json["description"]);
  }
}
