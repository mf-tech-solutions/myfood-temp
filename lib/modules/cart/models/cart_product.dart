import 'package:flutter/material.dart' show immutable, required;
import '../../food/models/product.dart';

@immutable
class CartProduct {
  final IProduct product;
  final int amount;

  double get totalPrice => amount * product.unitaryPrice;

  CartProduct({@required this.product, @required this.amount});

  Map<String, dynamic> toJson() =>
      {'product': product.toJson(), 'amount': amount};

  CartProduct copyWith({
    IProduct product,
    int amount,
  }) {
    return CartProduct(
      product: product ?? this.product,
      amount: amount ?? this.amount,
    );
  }
}
