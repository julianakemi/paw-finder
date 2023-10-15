class UserModel {
  String name;
  String phone;
  String email;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
  });

  factory UserModel.fromJson(Map <String, dynamic> json){
    return UserModel(name: json["name"], phone: json["phone"], email: json["email"]);
  }
}
