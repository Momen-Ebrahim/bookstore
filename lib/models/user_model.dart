import 'package:bookstore/core/api/end_ponits.dart';

class UserModel {
  // final String profilePic;
  final String name;
  final String email;
  final String phone;
  final Map<String, dynamic> address;

  UserModel(
      {
      // required this.profilePic,
      required this.name,
      required this.email,
      required this.address,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      // profilePic: jsonData['user'][ApiKey.profilePic],
      name: jsonData['user'][ApiKey.name],
      email: jsonData['user'][ApiKey.email],
      phone: jsonData['user'][ApiKey.phone],
      address: jsonData['user'][ApiKey.location],
    );
  }
}
