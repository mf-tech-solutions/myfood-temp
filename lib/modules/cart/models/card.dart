import 'package:flutter/material.dart';

@immutable
class UserCard {
  final int id;
  final String lastDigits;
  final String number;

  UserCard({@required this.id, @required this.lastDigits, this.number});

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(
      id: json['id'],
      lastDigits: json['cardNumber'],
    );
  }

  factory UserCard.fromDto(UserCardDto dto) {
    return UserCard(id: dto.id, lastDigits: dto.lastDigits);
  }
}

class UserCardDto {
  final int id;
  final String cardNumber;

  String get lastDigits => cardNumber.substring(cardNumber.length - 4);

  UserCardDto({@required this.cardNumber, this.id});
}
