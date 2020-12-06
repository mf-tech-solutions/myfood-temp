import 'package:flutter/material.dart';

import 'cart_product.dart';
import 'deliver_info.dart';
import 'order_status.dart';
import 'payment_method.dart';

class Order {
  final int orderId;
  final List<CartProduct> cartProducts;
  final DeliverInfo deliverInfo;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
  final String taxNumber;
  final DateTime createdAt;
  final DateTime finishedAt;

  bool get isActive => this.finishedAt == null;

  Order({
    @required this.orderId,
    @required this.cartProducts,
    @required this.createdAt,
    @required this.deliverInfo,
    @required this.status,
    @required this.paymentMethod,
    @required this.taxNumber,
    this.finishedAt,
  });

  factory Order.noTaxNumber(Order data) {
    return Order(
      cartProducts: data.cartProducts,
      createdAt: null,
      deliverInfo: data.deliverInfo,
      orderId: data.orderId,
      paymentMethod: data.paymentMethod,
      status: data.status,
      taxNumber: null,
    );
  }

  Order copyWith({
    List<CartProduct> cartProducts,
    DateTime createdAt,
    DeliverInfo deliverInfo,
    DateTime finishedAt,
    int orderId,
    PaymentMethod paymentMethod,
    OrderStatus status,
    String taxNumber,
  }) {
    return Order(
      cartProducts: cartProducts ?? this.cartProducts,
      createdAt: createdAt ?? this.createdAt,
      deliverInfo: deliverInfo ?? this.deliverInfo,
      finishedAt: finishedAt ?? this.finishedAt,
      orderId: orderId ?? this.orderId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      taxNumber: taxNumber ?? this.taxNumber,
    );
  }
}
