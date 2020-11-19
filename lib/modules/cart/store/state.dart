import 'package:flutter/material.dart' show immutable, required;

import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/payment_method.dart';

@immutable
class CartState {
  final List<CartProduct> products;
  final bool isDeliver;

  final List<UserCard> cards;
  final bool loadingCards;
  final bool shouldLoadCards;

  final PaymentMethod paymentMethod;

  CartState({
    @required this.products,
    @required this.isDeliver,
    @required this.cards,
    @required this.loadingCards,
    @required this.paymentMethod,
    @required this.shouldLoadCards,
  });

  factory CartState.initial() {
    return CartState(
      products: [],
      isDeliver: true,
      cards: [],
      loadingCards: false,
      paymentMethod: null,
      shouldLoadCards: true,
    );
  }

  factory CartState.noCards(CartState currentState) {
    return CartState(
      products: currentState.products,
      isDeliver: currentState.isDeliver,
      cards: [],
      loadingCards: false,
      paymentMethod: null,
      shouldLoadCards: false,
    );
  }

  CartState copyWith({
    List<CartProduct> products,
    bool isDeliver,
    List<UserCard> cards,
    bool loadingCards,
    bool shouldLoadCards,
    PaymentMethod paymentMethod,
  }) {
    return CartState(
      products: products ?? this.products,
      isDeliver: isDeliver ?? this.isDeliver,
      cards: cards ?? this.cards,
      loadingCards: loadingCards ?? this.loadingCards,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      shouldLoadCards: shouldLoadCards ?? this.shouldLoadCards,
    );
  }
}
