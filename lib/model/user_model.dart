class User {
  String name;
  String phoneNumber;
  String email;

  User({
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber
    };
  }

  factory User.fromJson(Map <String, dynamic> json){
    return User(name: json["name"], phoneNumber: json["phoneNumber"], email: json["email"]);
  }}
