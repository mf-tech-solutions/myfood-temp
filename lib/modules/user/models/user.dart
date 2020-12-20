import 'package:flutter/material.dart';

import 'user_dto.dart';

@immutable
class User {
  final int userId;
  final String cpf;
  final String name;
  final String phone;
  final String email;
  final String imageUrl;

  User({
    @required this.userId,
    @required this.cpf,
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.imageUrl,
  });

  factory User.fromDto(UserDto userDto) {
    return User(
      userId: userDto.userId,
      cpf: userDto.cpf,
      name: userDto.name,
      phone: userDto.phone,
      email: userDto.email,
      imageUrl: userDto.imageUrl,
    );
  }
}
