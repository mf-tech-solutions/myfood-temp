import 'user_dto.dart';
import 'package:flutter/material.dart';

import 'address.dart';

@immutable
class User {
  final int userId;
  final String cpf;
  final String name;
  final String phone;
  final String email;
  final String imageUrl;
  final Address address;

  User({
    @required this.userId,
    @required this.cpf,
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.imageUrl,
    @required this.address,
  });

  factory User.fromDto(UserDto userDto) {
    return User(
      userId: userDto.userId,
      cpf: userDto.cpf,
      name: userDto.name,
      phone: userDto.phone,
      email: userDto.email,
      imageUrl: userDto.imageUrl,
      address: Address(
        addressId: userDto.addressId,
        zipcode: userDto.zipcode,
        street: userDto.street,
        number: userDto.streetNumber,
        complement: userDto.complement,
        isDefault: userDto.isDefaultAddress,
      ),
    );
  }
}
