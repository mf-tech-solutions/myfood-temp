import 'package:flutter/material.dart' show immutable, required;

import '../models/card.dart';
import '../models/cart_product.dart';

@immutable
class CartState {
  final List<CartProduct> products;
  final bool isDeliver;

  final List<UserCard> cards;
  final bool loadingCards;

  CartState({
    @required this.products,
    @required this.isDeliver,
    @required this.cards,
    @required this.loadingCards,
  });

  factory CartState.initial() {
    return CartState(
      products: [],
      isDeliver: true,
      cards: [],
      loadingCards: false,
    );
  }

  CartState copyWith({
    List<CartProduct> products,
    bool isDeliver,
    List<UserCard> cards,
    bool loadingCards,
  }) {
    return CartState(
      products: products ?? this.products,
      isDeliver: isDeliver ?? this.isDeliver,
      cards: cards ?? this.cards,
      loadingCards: loadingCards ?? this.loadingCards,
    );
  }
}
