import 'package:flutter/material.dart';

@immutable
class UserCard {
  final int id;
  final String lastDigits;

  UserCard({@required this.id, @required this.lastDigits});

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(
      id: json['id'],
      lastDigits: json['cardNumber'],
    );
  }
}
