import 'package:flutter/material.dart' show immutable, required;

import '../models/address.dart';
import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/order.dart';
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

//region Place order
class PlaceOrderPayload {
  final Order order;

  PlaceOrderPayload(this.order);
}

class PlaceOrderAction {
  PlaceOrderPayload payload;

  PlaceOrderAction(Order order) {
    payload = PlaceOrderPayload(order);
  }
}

class PlaceOrderSuccessPayload {
  final Order order;

  PlaceOrderSuccessPayload(this.order);
}

class PlaceOrderSuccessAction {
  PlaceOrderSuccessPayload payload;

  PlaceOrderSuccessAction(Order order) {
    payload = PlaceOrderSuccessPayload(order);
  }
}

class PlaceOrderFailPayload {
  Order order;

  PlaceOrderFailPayload(order);
}

class PlaceOrderFailAction {
  PlaceOrderFailPayload payload;

  PlaceOrderFailAction(Order order) {
    payload = PlaceOrderFailPayload(order);
  }
}
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

//region Get addressess
class GetDeliverAddressessAction {}

class GetDeliverAddressessSuccessPayload {
  final List<Address> addresses;

  GetDeliverAddressessSuccessPayload(this.addresses);
}

class GetDeliverAddressessSuccessAction {
  GetDeliverAddressessSuccessPayload payload;

  GetDeliverAddressessSuccessAction(List<Address> addresses) {
    payload = GetDeliverAddressessSuccessPayload(addresses);
  }
}

class GetDeliverAddressessFailAction {}
//endregion

//region Add deliver address
class AddDeliverAddressAction {}

class AddDeliverAddressSuccessPayload {
  final Address address;

  AddDeliverAddressSuccessPayload(this.address);
}

class AddDeliverAddressSuccessAction {
  AddDeliverAddressSuccessPayload payload;

  AddDeliverAddressSuccessAction(Address address) {
    payload = AddDeliverAddressSuccessPayload(address);
  }
}

class AddDeliverAddressFailAction {}
//endregion

//region Set default deliver address
class SetDefaultDeliverAddressPayload {
  final Address address;

  SetDefaultDeliverAddressPayload(this.address);
}

class SetDefaultDeliverAddressAction {
  SetDefaultDeliverAddressPayload payload;

  SetDefaultDeliverAddressAction(Address address) {
    payload = SetDefaultDeliverAddressPayload(address);
  }
}

class SetDefaultDeliverAddressSuccessAction {}

class SetDefaultDeliverAddressFailPayload {
  final Address previousAddress;

  SetDefaultDeliverAddressFailPayload(this.previousAddress);
}

class SetDefaultDeliverAddressFailAction {
  SetDefaultDeliverAddressFailPayload payload;

  SetDefaultDeliverAddressFailAction(Address previousAddress) {
    payload = SetDefaultDeliverAddressFailPayload(previousAddress);
  }
}
//endregion
