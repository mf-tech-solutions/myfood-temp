import 'package:flutter/material.dart';

@immutable
class UserCard {
  final String lastDigits;

  UserCard({@required this.lastDigits});

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(lastDigits: json['cardNumber']);
  }
}
