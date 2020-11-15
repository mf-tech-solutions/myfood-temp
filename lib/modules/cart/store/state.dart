import 'package:flutter/material.dart' show immutable, required;
import '../models/cart_product.dart';

@immutable
class CartState {
  final List<CartProduct> products;
  final bool isDeliver;

  CartState({
    @required this.products,
    @required this.isDeliver,
  });

  factory CartState.initial() {
    return CartState(
      products: [],
      isDeliver: true,
    );
  }

  CartState copyWith({
    List<CartProduct> products,
    bool isDeliver,
  }) {
    return CartState(
      products: products ?? this.products,
      isDeliver: isDeliver ?? this.isDeliver,
    );
  }
}
