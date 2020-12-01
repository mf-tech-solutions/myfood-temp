import 'package:flutter/material.dart' show immutable, required;

@immutable
class IProduct {
  final int id;
  final String name;
  final double unitaryPrice;
  final String description;
  final String imageUrl;
  final List<IProduct> additionals;
  final int parentId;

  IProduct({
    @required this.id,
    @required this.name,
    @required this.unitaryPrice,
    @required this.description,
    @required this.imageUrl,
    this.additionals = const [],
    this.parentId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'unitaryPrice': unitaryPrice.toStringAsFixed(2),
        'imageUrl': imageUrl,
        'description': description,
        'additionals': additionals,
        'parentId': parentId,
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
    @required String imageUrl,
    this.description,
    List<Product> additionals,
    int parentId,
  }) : super(
          id: id,
          name: name,
          unitaryPrice: unitaryPrice,
          imageUrl: imageUrl,
          description: description,
          additionals: additionals ?? [],
          parentId: parentId,
        );
}
