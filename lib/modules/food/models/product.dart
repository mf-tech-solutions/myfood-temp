import 'package:flutter/material.dart' show immutable, required;

@immutable
class IProduct {
  final int id;
  final String name;
  final double unitaryPrice;

  IProduct({
    @required this.id,
    @required this.name,
    @required this.unitaryPrice,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'unitaryPrice': unitaryPrice.toStringAsFixed(2),
      };
}

@immutable
class Product extends IProduct {
  final int categoryId;
  final String description;

  Product({
    @required int id,
    @required this.categoryId,
    @required String name,
    @required double unitaryPrice,
    this.description,
  }) : super(
          id: id,
          name: name,
          unitaryPrice: unitaryPrice,
        );
}
