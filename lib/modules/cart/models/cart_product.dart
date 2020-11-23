import 'package:flutter/material.dart' show required;
import '../../food/models/product.dart';

class CartProduct {
  final IProduct product;
  final int amount;
  List<CartProduct> additionals;

  double get totalPrice =>
      amount * product.unitaryPrice +
      additionals.fold(
        0.0,
        (prev, element) => prev + element.totalPrice,
      );

  bool get hasAdditionals => this.additionals.length > 0;

  CartProduct({
    @required this.product,
    @required this.amount,
    this.additionals = const [],
  }) {
    additionals = product.additionals
        .map((e) => CartProduct(product: e, amount: 0))
        .toList();
  }

  Map<String, dynamic> toJson() =>
      {'product': product.toJson(), 'amount': amount};

  CartProduct copyWith({
    IProduct product,
    int amount,
    List<CartProduct> additionals,
  }) {
    return CartProduct(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      additionals: additionals ?? this.additionals,
    );
  }
}
