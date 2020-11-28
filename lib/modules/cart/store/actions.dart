import 'package:flutter/material.dart' show immutable, required;

import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/order_status.dart';
import '../models/payment_method.dart';
import '../../food/models/product.dart';

//#region Add to cart
@immutable
class AddItemsToCartPayload {
  final CartProduct product;

  AddItemsToCartPayload({@required this.product});
}

class AddItemsToCartAction {
  AddItemsToCartPayload payload;

  AddItemsToCartAction({@required CartProduct product}) {
    payload = AddItemsToCartPayload(product: product);
  }
}
//endregion

//region Remove from cart
@immutable
class RemoveFromCartPayload {
  final int productId;

  RemoveFromCartPayload({@required this.productId});
}

class RemoveFromCartAction {
  RemoveFromCartPayload payload;

  RemoveFromCartAction({@required Product product}) {
    payload = RemoveFromCartPayload(productId: product.id);
  }
}
//endregion

//region Clear cart
class ClearCartAction {}
//endregion

//region Deliver option
class ToggleDeliverOption {}
//endregion

//region Confirm order
class ConfirmOrderAction {}

class ConfirmOrderSuccessPayload {
  final OrderStatus orderStatus;

  ConfirmOrderSuccessPayload(this.orderStatus);
}

class ConfirmOrderSuccessAction {
  ConfirmOrderSuccessPayload payload;

  ConfirmOrderSuccessAction(OrderStatus orderStatus) {
    payload = ConfirmOrderSuccessPayload(orderStatus);
  }
}

class ConfirmOrderFailAction {}
//endregion

//region Get user cards
class GetUserCardsAction {}

class GetUserCardsSuccessPayload {
  final List<UserCard> cards;

  GetUserCardsSuccessPayload(this.cards);
}

class GetUserCardsSuccessAction {
  GetUserCardsSuccessPayload payload;

  GetUserCardsSuccessAction(List<UserCard> cards) {
    payload = GetUserCardsSuccessPayload(cards);
  }
}

class GetUserCardsFailAction {}
//endregion

//region Add user card
class AddUserCardAction {}

class AddUserCardSuccessPayload {
  final UserCard card;

  AddUserCardSuccessPayload(this.card);
}

class AddUserCardSuccessAction {
  AddUserCardSuccessPayload payload;

  AddUserCardSuccessAction(UserCard card) {
    payload = AddUserCardSuccessPayload(card);
  }
}

class AddUserCardFailAction {}
//endregion

//region Set payment method
class SetPaymentMethodPayload {
  PaymentMethod paymentMethod;

  SetPaymentMethodPayload(this.paymentMethod);
}

class SetPaymentMethodAction {
  SetPaymentMethodPayload payload;

  SetPaymentMethodAction(PaymentMethod paymentMethod) {
    payload = SetPaymentMethodPayload(paymentMethod);
  }
}
//endregion

//region Set deliver info
class SetDeliverInfoPayload {
  final DeliverInfo deliverInfo;

  SetDeliverInfoPayload(this.deliverInfo);
}

class SetDeliverInfoAction {
  SetDeliverInfoPayload payload;

  SetDeliverInfoAction(DeliverInfo info) {
    payload = SetDeliverInfoPayload(info);
  }
}
//endregion
