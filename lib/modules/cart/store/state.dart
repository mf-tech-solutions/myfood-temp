import 'package:flutter/material.dart' show immutable, required;

import '../models/address.dart';
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

  final List<Address> addresses;
  final bool loadingAddresses;

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
    @required this.loadingAddresses,
    @required this.addresses,
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
      deliverInfo: null,
      addresses: [],
      loadingAddresses: null,
    );
  }

  factory CartState.noCards(CartState currentState) {
    return CartState(
      addresses: currentState.addresses,
      cards: [],
      currentOrder: currentState.currentOrder,
      deliverInfo: currentState.deliverInfo,
      isDeliver: currentState.isDeliver,
      loadingAddresses: currentState.loadingAddresses,
      loadingCards: false,
      ordering: currentState.ordering,
      orderStatus: currentState.orderStatus,
      paymentMethod: null,
      products: currentState.products,
      shouldLoadCards: false,
    );
  }

  factory CartState.noOrder({@required CartState currentState}) {
    return CartState(
      addresses: currentState.addresses,
      cards: currentState.cards,
      currentOrder: null,
      deliverInfo: currentState.deliverInfo,
      isDeliver: currentState.isDeliver,
      loadingAddresses: currentState.loadingAddresses,
      loadingCards: currentState.loadingCards,
      ordering: false,
      orderStatus: OrderStatus.none,
      paymentMethod: currentState.paymentMethod,
      products: currentState.products,
      shouldLoadCards: currentState.shouldLoadCards,
    );
  }

  CartState copyWith({
    List<Address> addresses,
    List<UserCard> cards,
    Order currentOrder,
    DeliverInfo deliverInfo,
    bool isDeliver,
    bool loadingAddresses,
    bool loadingCards,
    bool ordering,
    OrderStatus orderStatus,
    PaymentMethod paymentMethod,
    List<CartProduct> products,
    bool shouldLoadCards,
  }) {
    return CartState(
      addresses: addresses ?? this.addresses,
      cards: cards ?? this.cards,
      currentOrder: currentOrder ?? this.currentOrder,
      deliverInfo: deliverInfo ?? this.deliverInfo,
      isDeliver: isDeliver ?? this.isDeliver,
      loadingAddresses: loadingAddresses ?? this.loadingAddresses,
      loadingCards: loadingCards ?? this.loadingCards,
      ordering: ordering ?? this.ordering,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      products: products ?? this.products,
      shouldLoadCards: shouldLoadCards ?? this.shouldLoadCards,
    );
  }
}
