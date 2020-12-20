import 'package:flutter/material.dart';

class UserDto {
  final int userId;
  final String cpf;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  UserDto({
    @required this.userId,
    @required this.cpf,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cpf': cpf,
      'name': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
