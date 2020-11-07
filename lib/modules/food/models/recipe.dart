import 'package:flutter/material.dart' show immutable, required;

import 'ingredient.dart';

@immutable
class Recipe {
  final int id;
  final String name;
  final List<Ingredient> ingredients;
  final String directions;

  Recipe({
    @required this.id,
    @required this.name,
    @required this.ingredients,
    @required this.directions,
  });
}
