import 'package:flutter/material.dart' show immutable, required;

@immutable
class FoodGame {
  final int id;
  final String name;
  final String description;

  FoodGame({
    @required this.id,
    @required this.name,
    @required this.description,
  });
}
