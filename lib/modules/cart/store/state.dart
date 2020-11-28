import 'package:flutter/material.dart' show immutable, required;

import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/order.dart';
import '../models/order_status.dart';
import '../models/payment_method.dart';

@immutable
class CartState {
  final Order currentOrder;
  final List<CartProduct> products;
  final bool isDeliver;

  final List<UserCard> cards;
  final bool loadingCards;
  final bool shouldLoadCards;

  final DeliverInfo deliverInfo;
  final PaymentMethod paymentMethod;

  final bool ordering;
  final OrderStatus orderStatus;

  CartState({
    @required this.products,
    @required this.isDeliver,
    @required this.cards,
    @required this.deliverInfo,
    @required this.loadingCards,
    @required this.shouldLoadCards,
    @required this.paymentMethod,
    @required this.ordering,
    @required this.orderStatus,
    this.currentOrder,
  });

  factory CartState.initial() {
    return CartState(
      products: [],
      isDeliver: true,
      cards: [],
      loadingCards: false,
      paymentMethod: null,
      shouldLoadCards: true,
      ordering: false,
      orderStatus: OrderStatus.none,
      deliverInfo: DeliverInfo(),
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
      ordering: currentState.ordering,
      orderStatus: currentState.orderStatus,
      deliverInfo: currentState.deliverInfo,
    );
  }

  CartState copyWith({
    List<CartProduct> products,
    bool isDeliver,
    List<UserCard> cards,
    bool loadingCards,
    bool shouldLoadCards,
    PaymentMethod paymentMethod,
    bool ordering,
    OrderStatus orderStatus,
    DeliverInfo deliverInfo,
  }) {
    return CartState(
      products: products ?? this.products,
      isDeliver: isDeliver ?? this.isDeliver,
      cards: cards ?? this.cards,
      loadingCards: loadingCards ?? this.loadingCards,
      shouldLoadCards: shouldLoadCards ?? this.shouldLoadCards,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      ordering: ordering ?? this.ordering,
      orderStatus: orderStatus ?? this.orderStatus,
      deliverInfo: deliverInfo ?? this.deliverInfo,
    );
  }
}
