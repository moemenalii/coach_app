import 'package:healthystate/core/api/end_ponits.dart';

class UserModel {
  final String? profilePic;
  final String email;
  final String name;

  UserModel({
    this.profilePic,
    required this.email,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      profilePic: jsonData['data'][ApiKey.profilePic] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCHU5JIkqfD2z1KMc4c1nW4zdArnxBM3cCcQ&s',
      email: jsonData['data'][ApiKey.email] ?? "black_Knight@gmail.com",
      name: jsonData['data'][ApiKey.name] ?? 'moemen ail',
    );
  }
}
