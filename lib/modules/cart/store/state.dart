import 'package:flutter/material.dart' show immutable, required;

import '../models/address.dart';
import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/order.dart';
import '../models/payment_method.dart';

@immutable
class CartState {
  final Order currentOrder;
  final List<Order> orderList;

  final List<CartProduct> products;
  final bool isDeliver;

  final List<UserCard> cards;
  final bool loadingCards;
  final bool shouldLoadCards;

  final DeliverInfo deliverInfo;
  final PaymentMethod paymentMethod;

  final List<Address> addresses;
  final bool loadingAddresses;

  final bool includeSocialIdInNote;
  final String socialIdInNote;

  CartState({
    @required this.products,
    @required this.isDeliver,
    @required this.cards,
    @required this.deliverInfo,
    @required this.loadingCards,
    @required this.shouldLoadCards,
    @required this.paymentMethod,
    @required this.loadingAddresses,
    @required this.addresses,
    @required this.includeSocialIdInNote,
    this.socialIdInNote,
    this.currentOrder,
    this.orderList,
  });

  factory CartState.initial() {
    return CartState(
      addresses: [],
      cards: [],
      deliverInfo: null,
      isDeliver: true,
      loadingAddresses: null,
      loadingCards: false,
      orderList: [],
      paymentMethod: null,
      products: [],
      shouldLoadCards: true,
      includeSocialIdInNote: true,
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
      orderList: currentState.orderList,
      paymentMethod: null,
      products: currentState.products,
      shouldLoadCards: false,
      includeSocialIdInNote: currentState.includeSocialIdInNote,
      socialIdInNote: currentState.socialIdInNote,
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
      orderList: currentState.orderList,
      paymentMethod: currentState.paymentMethod,
      products: currentState.products,
      shouldLoadCards: currentState.shouldLoadCards,
      includeSocialIdInNote: currentState.includeSocialIdInNote,
      socialIdInNote: currentState.socialIdInNote,
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
    List<Order> orderList,
    PaymentMethod paymentMethod,
    List<CartProduct> products,
    bool shouldLoadCards,
    bool includeSocialIdInNote,
    String socialIdInNote,
  }) {
    return CartState(
      addresses: addresses ?? this.addresses,
      cards: cards ?? this.cards,
      currentOrder: currentOrder ?? this.currentOrder,
      deliverInfo: deliverInfo ?? this.deliverInfo,
      isDeliver: isDeliver ?? this.isDeliver,
      loadingAddresses: loadingAddresses ?? this.loadingAddresses,
      loadingCards: loadingCards ?? this.loadingCards,
      orderList: orderList ?? this.orderList,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      products: products ?? this.products,
      shouldLoadCards: shouldLoadCards ?? this.shouldLoadCards,
      includeSocialIdInNote:
          includeSocialIdInNote ?? this.includeSocialIdInNote,
      socialIdInNote: socialIdInNote ?? this.socialIdInNote,
    );
  }
}
