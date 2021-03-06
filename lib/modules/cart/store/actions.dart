import 'package:flutter/material.dart' show immutable, required;

import '../../food/models/product.dart';
import '../models/address.dart';
import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/order.dart';
import '../models/payment_method.dart';

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

//region Update user card
class UpdateUserCardAction {}

class UpdateUserCardSuccessAction {
  UpdateUserCardSuccessPayload payload;

  UpdateUserCardSuccessAction(UserCard card) {
    payload = UpdateUserCardSuccessPayload(card);
  }
}

class UpdateUserCardSuccessPayload {
  final UserCard card;

  UpdateUserCardSuccessPayload(this.card);
}

class UpdateUserCardFailAction {}
//endregion

//region Remove card
class RemoveUserCardAction {}

class RemoveCardSuccessPayload {
  final int cardId;

  RemoveCardSuccessPayload(this.cardId);
}

class RemoveUserCardSuccessAction {
  RemoveCardSuccessPayload payload;

  RemoveUserCardSuccessAction(int cardId) {
    payload = RemoveCardSuccessPayload(cardId);
  }
}

class RemoveUserCardFailAction {}
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

//region Set social id in note
class SetSocialIdInNoteAction {
  SetSocialIdInNotePayload payload;

  SetSocialIdInNoteAction(bool includeSocialIdInNote, String socialId) {
    payload = SetSocialIdInNotePayload(includeSocialIdInNote, socialId);
  }
}

class SetSocialIdInNotePayload {
  final bool includeSocialIdInNote;
  final String socialId;

  SetSocialIdInNotePayload(this.includeSocialIdInNote, this.socialId);
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

//region Get addresses
class GetDeliverAddressesAction {}

class GetDeliverAddressesSuccessPayload {
  final List<Address> addresses;

  GetDeliverAddressesSuccessPayload(this.addresses);
}

class GetDeliverAddressesSuccessAction {
  GetDeliverAddressesSuccessPayload payload;

  GetDeliverAddressesSuccessAction(List<Address> addresses) {
    payload = GetDeliverAddressesSuccessPayload(addresses);
  }
}

class GetDeliverAddressesFailAction {}
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

// region Update deliver address
class UpdateDeliverAddressAction {}

class UpdateDeliverAddressSuccessAction {
  UpdateDeliverAddressSuccessPayload payload;

  UpdateDeliverAddressSuccessAction(Address address) {
    payload = UpdateDeliverAddressSuccessPayload(address);
  }
}

class UpdateDeliverAddressSuccessPayload {
  final Address address;

  UpdateDeliverAddressSuccessPayload(this.address);
}

class UpdateDeliverAddressFailAction {}
// endregion

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

//region Get order list
class GetOrderListAction {}

class GetOrderListSuccessPayload {
  final List<Order> orderList;

  GetOrderListSuccessPayload(this.orderList);
}

class GetOrderListSuccessAction {
  GetOrderListSuccessPayload payload;

  GetOrderListSuccessAction(List<Order> orderList) {
    payload = GetOrderListSuccessPayload(orderList);
  }
}

class GetOrderListFailAction {}
//endregion
