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

  Order({
    @required this.orderId,
    @required this.cartProducts,
    @required this.deliverInfo,
    @required this.status,
    @required this.paymentMethod,
    @required this.taxNumber,
  });

  factory Order.noTaxNumber(Order data) {
    return Order(
      orderId: data.orderId,
      cartProducts: data.cartProducts,
      deliverInfo: data.deliverInfo,
      paymentMethod: data.paymentMethod,
      status: data.status,
      taxNumber: null,
    );
  }

  Order copyWith({
    int orderId,
    List<CartProduct> cartProducts,
    PaymentMethod paymentMethod,
    OrderStatus status,
    DeliverInfo deliverInfo,
    String taxNumber,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      cartProducts: cartProducts ?? this.cartProducts,
      deliverInfo: deliverInfo ?? this.deliverInfo,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      taxNumber: taxNumber ?? this.taxNumber,
    );
  }
}
