class Pet {
  String type;
  String img;
  String location;
  String breed;
  String size;
  String gender;
  String color;
  String description;

  Pet({
    required this.type,
    required this.img,
    required this.location,
    required this.breed,
    required this.size,
    required this.gender,
    required this.color,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'img': img,
      'location': location,
      'breed': breed,
      'size': size,
      'gender': gender,
      'color': color,
      'description': description,
    };
  }

  factory Pet.fromJson(Map <String, dynamic> json){
    return Pet(type: json["type"], img: json["img"], location: json["location"], breed: json["breed"], size: json["size"], gender: json["gender"], color: json["color"], description: json["description"]);
  }
}
