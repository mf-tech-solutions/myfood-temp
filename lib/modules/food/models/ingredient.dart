import 'package:flutter/material.dart' show immutable, required;

@immutable
class Ingredient {
  final int id;
  final String name;
  final int amount;
  final String measure;

  Ingredient({
    @required this.id,
    @required this.name,
    @required this.amount,
    @required this.measure,
  });
}
