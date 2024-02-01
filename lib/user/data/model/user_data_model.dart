class UserDataModel {
  final int id;
  final String name;
  final String email;
  final String token;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}
