import 'package:flutter/material.dart';

class UserDto {
  final int userId;
  final String cpf;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  final int addressId;
  final String zipcode;
  final String street;
  final int streetNumber;
  final String complement;

  UserDto({
    @required this.userId,
    @required this.cpf,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.imageUrl,
    @required this.addressId,
    @required this.zipcode,
    @required this.street,
    @required this.streetNumber,
    @required this.complement,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cpf': cpf,
      'name': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
      'address': {
        'addressId': addressId,
        'zipcode': zipcode,
        'street': street,
        'number': streetNumber,
        'complement': complement,
      },
    };
  }
}
