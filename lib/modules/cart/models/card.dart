import 'package:flutter/material.dart';

@immutable
class UserCard {
  final int id;
  final String number;
  final String cardHolderName;
  final String cardHolderSocialId;
  final String lastDigits;
  final int cvv;
  final String dueDate;

  UserCard({
    @required this.id,
    @required this.lastDigits,
    @required this.cardHolderName,
    @required this.cardHolderSocialId,
    @required this.cvv,
    @required this.dueDate,
    this.number,
  });

  factory UserCard.fromDto(UserCardDto dto) {
    return UserCard(
      id: dto.id,
      number: dto.cardNumber,
      lastDigits: dto.lastDigits,
      cvv: dto.cvv,
      dueDate: dto.dueDate,
      cardHolderName: dto.cardHolderName,
      cardHolderSocialId: dto.cardHolderSocialId,
    );
  }
}

class UserCardDto {
  final int id;
  final String cardNumber;
  final int cvv;
  final String dueDate;
  final String cardHolderName;
  final String cardHolderSocialId;

  String get lastDigits => cardNumber.substring(cardNumber.length - 4);

  UserCardDto({
    @required this.cardNumber,
    @required this.cvv,
    @required this.dueDate,
    @required this.cardHolderName,
    @required this.cardHolderSocialId,
    this.id,
  });
}
