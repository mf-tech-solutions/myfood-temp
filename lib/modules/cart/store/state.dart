import 'package:flutter/material.dart' show immutable, required;
import '../models/cart_product.dart';

@immutable
class CartState {
  final List<CartProduct> products;

  CartState({@required this.products});

  factory CartState.initial() => CartState(products: []);

  CartState copyWith({List<CartProduct> products}) =>
      CartState(products: products ?? this.products);
}
