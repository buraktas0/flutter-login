import 'package:flutter_application_1/domain/entities/user.dart';

class UserModel {
  final String email;
  final String password;

  UserModel(this.email, this.password);

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  User toEntity() => User(email, password);
}
