import 'package:flutter/material.dart' show required;
import '../../food/models/product.dart';

class CartProduct {
  final IProduct product;
  final int amount;
  final List<CartProduct> additionals;
  final int parentId;

  double get totalPrice =>
      amount * product.unitaryPrice +
      additionals.fold(
        0.0,
        (prev, element) => prev + element.totalPrice,
      );

  bool get hasAdditionals => this.additionals.length > 0;

  CartProduct({
    this.additionals,
    this.parentId,
    @required this.amount,
    @required this.product,
  });

  factory CartProduct.initial() {
    return CartProduct(
      amount: 0,
      product: null,
      additionals: [],
      parentId: null,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product.toJson(),
        'amount': amount,
      };

  CartProduct copyWith({
    IProduct product,
    int amount,
    List<CartProduct> additionals,
    int parentId,
  }) {
    return CartProduct(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      additionals: additionals ?? this.additionals,
      parentId: parentId ?? this.parentId,
    );
  }
}
