import 'package:flutter/material.dart';

import '../../../store/store.dart';
import '../models/address.dart';
import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/order_status.dart';
import '../models/payment_method.dart';
import '../models/payment_mothod_type.dart';
import '../utils.dart';

CartProduct getCartProductByProductId(int productId) {
  return AppStore.store.state.cartState.products.firstWhere(
    (element) => element.product.id == productId,
    orElse: () => null,
  );
}

int getProductAmountInCart(int productId) {
  final cartProduct = getCartProductByProductId(productId);
  if (cartProduct == null) return 0;
  return cartProduct.amount;
}

UserCard getCardById({int cardId}) {
  if (cardId == null) return null;
  return AppStore.store.state.cartState.cards?.firstWhere(
    (card) => card.id == cardId,
    orElse: () => null,
  );
}

bool shouldLoadCards() {
  return AppStore.store.state.cartState.shouldLoadCards;
}

PaymentMethod getSelectedPaymentMethod() {
  return AppStore.store.state.cartState.paymentMethod;
}

bool includeSocialIdInNote() {
  return AppStore.store.state.cartState.includeSocialIdInNote;
}

bool isCardSelectedPaymentMethod(int cardId) {
  final selectedPaymentMethod = getSelectedPaymentMethod();
  return selectedPaymentMethod.type == PaymentMethodType.CARD &&
      selectedPaymentMethod.cardId == cardId;
}

String getOrderStatusText(OrderStatus status) {
  switch (status) {
    case OrderStatus.denied:
      return 'Seu pedido foi negado.';

    case OrderStatus.preparing:
      return 'Seu pedido está sendo preparado!';

    case OrderStatus.delivering:
      return 'Seu pedido está sendo entregue! Por favor aguarde.';

    case OrderStatus.delivered:
      return 'Por favor confirme o recebimento do seu pedido.';

    case OrderStatus.confirmedDelivered:
      return 'Pedido entregue.';

    case OrderStatus.notDelivered:
      return 'Sentimos muito que seu pedido não foi entregue.';

    case OrderStatus.canceled:
      return 'Sentimos muito mas seu pedido foi cancelado.';

    case OrderStatus.created:
      return 'Pedido sendo enviado.';

    default:
      return 'Não foi possível obter informações sobre seu pedido. Por favor tente novamente mais tarde.';
  }
}

dynamic getOrderStatusIconUrl() {
  final status = AppStore.store.state.cartState.currentOrder.status;
  switch (status) {
    case OrderStatus.preparing:
      return '${Utils.orderImagesPath}order_preparing.svg';

    case OrderStatus.delivering:
      return '${Utils.orderImagesPath}order_delivering.svg';

    case OrderStatus.delivered:
      return '${Utils.orderImagesPath}order_delivered.svg';

    default:
      return Icons.cancel_outlined;
  }
}

bool isOrdering() {
  final currentOrder = AppStore.store.state.cartState.currentOrder;
  return currentOrder != null && currentOrder.status == OrderStatus.created;
}

DeliverInfo getAddress() {
  final addresses = AppStore.store.state.cartState.addresses;
  if (addresses == null) {
    return null;
  }

  final defaultAddress = addresses.firstWhere(
    (element) => element.isDefault,
    orElse: () => null,
  );
  if (defaultAddress == null) {
    return null;
  }

  return DeliverInfo(address: defaultAddress);
}

Address getDefaultDeliverAddress() {
  final address = AppStore.store.state.cartState.addresses.firstWhere(
    (element) => element.isDefault,
    orElse: () => null,
  );

  return address;
}
