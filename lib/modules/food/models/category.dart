import 'package:flutter/material.dart' show immutable, required;

@immutable
class Category {
  final int id;
  final String name;
  final String imageUrl;

  Category({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
  });
}
