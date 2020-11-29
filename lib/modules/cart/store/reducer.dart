import 'package:redux/redux.dart' show TypedReducer, combineReducers;

import 'actions.dart';
import 'selectors.dart';
import 'state.dart';
import '../models/cart_product.dart';
import '../models/order_status.dart';

final cartReducer = combineReducers<CartState>([
  TypedReducer(_addItemsToCart),
  TypedReducer(_removeFromCart),
  TypedReducer(_clearCart),
  TypedReducer(_toggleDeliverOption),
  TypedReducer(_confirmOrderStart),
  TypedReducer(_confirmOrderSuccess),
  TypedReducer(_confirmOrderFail),
  TypedReducer(_getUserCardsStart),
  TypedReducer(_getUserCardsSuccess),
  TypedReducer(_getUserCardsFail),
  TypedReducer(_addUserCardStart),
  TypedReducer(_addUserCardSuccess),
  TypedReducer(_addUserCardFail),
  TypedReducer(_setDeliverInfo),
  TypedReducer(_setPaymentMethod),
  TypedReducer(_getDeliverAddressesStart),
  TypedReducer(_getDeliverAddressesSuccess),
  TypedReducer(_getDeliverAddressesFail),
  TypedReducer(_addDeliverAddressStart),
  TypedReducer(_addDeliverAddressSuccess),
  TypedReducer(_addDeliverAddressFail),
  TypedReducer(_setDefaultDeliverAddress),
  TypedReducer(_setDefaultDeliverAddressSuccess),
  TypedReducer(_setDefaultDeliverAddressFail),
]);

CartState _addItemsToCart(CartState state, AddItemsToCartAction action) {
  final payload = action.payload.product;

  if (state.products.length == 0) return state.copyWith(products: [payload]);

  List<CartProduct> updatedProductList =
      state.products.take(state.products.length).toList();
  var alreadyInCart = getCartProductByProductId(payload.product.id) != null;

  if (alreadyInCart)
    updatedProductList = state.products
        .map((e) => e.product.id == payload.product.id ? payload : e)
        .toList();
  else
    updatedProductList.add(payload);

  return state.copyWith(products: updatedProductList);
}

CartState _removeFromCart(CartState state, RemoveFromCartAction action) {
  final productId = action.payload.productId;
  final updatedProducts =
      state.products.where((e) => e.product.id != productId).toList();
  return state.copyWith(products: updatedProducts);
}

//region Clear cart
CartState _clearCart(CartState state, ClearCartAction action) {
  return state.copyWith(products: []);
}
//endregion

//region
CartState _toggleDeliverOption(CartState state, ToggleDeliverOption action) {
  return state.copyWith(isDeliver: !state.isDeliver);
}
//endregion

//region Confirm order
CartState _confirmOrderStart(CartState state, ConfirmOrderAction action) {
  return state.copyWith(
    ordering: true,
    orderStatus: OrderStatus.created,
  );
}

CartState _confirmOrderSuccess(
  CartState state,
  ConfirmOrderSuccessAction action,
) {
  return state.copyWith(
    products: [],
    ordering: false,
    orderStatus: action.payload.orderStatus,
  );
}

CartState _confirmOrderFail(CartState state, ConfirmOrderFailAction action) {
  return state.copyWith(
    ordering: false,
    orderStatus: OrderStatus.error,
  );
}
//endregion

//region Get user cards
CartState _getUserCardsStart(CartState state, GetUserCardsAction action) {
  return state.copyWith(
    loadingCards: true,
    shouldLoadCards: false,
  );
}

CartState _getUserCardsSuccess(
  CartState state,
  GetUserCardsSuccessAction action,
) {
  final cards = action.payload.cards;

  return state.copyWith(
    cards: cards,
    loadingCards: false,
  );
}

CartState _getUserCardsFail(CartState state, GetUserCardsFailAction action) {
  return CartState.noCards(state);
}
//endregion

//region Add user card
CartState _addUserCardStart(CartState state, AddUserCardAction action) {
  return state;
}

CartState _addUserCardSuccess(
  CartState state,
  AddUserCardSuccessAction action,
) {
  final cards = [...state.cards, action.payload.card];

  return state.copyWith(cards: cards);
}

CartState _addUserCardFail(
  CartState state,
  AddUserCardFailAction action,
) {
  return state;
}
//region

CartState _setDeliverInfo(CartState state, SetDeliverInfoAction action) {
  return state.copyWith(deliverInfo: action.payload.deliverInfo);
}

CartState _setPaymentMethod(CartState state, SetPaymentMethodAction action) {
  return state.copyWith(paymentMethod: action.payload.paymentMethod);
}

CartState _getDeliverAddressesStart(
  CartState state,
  GetDeliverAddressessAction action,
) {
  return state.copyWith(loadingAddresses: true);
}

CartState _getDeliverAddressesSuccess(
  CartState state,
  GetDeliverAddressessSuccessAction action,
) {
  return state.copyWith(
    loadingAddresses: false,
    addresses: action.payload.addresses,
  );
}

CartState _getDeliverAddressesFail(
  CartState state,
  GetDeliverAddressessFailAction action,
) {
  return state.copyWith(loadingAddresses: false);
}

CartState _addDeliverAddressStart(
    CartState state, AddDeliverAddressAction action) {
  return state.copyWith(loadingAddresses: true);
}

CartState _addDeliverAddressSuccess(
  CartState state,
  AddDeliverAddressSuccessAction action,
) {
  final addresses = [...state.addresses, action.payload.address];

  return state.copyWith(
    loadingAddresses: false,
    addresses: addresses,
  );
}

CartState _addDeliverAddressFail(
  CartState state,
  AddDeliverAddressFailAction action,
) {
  return state.copyWith(loadingAddresses: false);
}

CartState _setDefaultDeliverAddress(
  CartState state,
  SetDefaultDeliverAddressAction action,
) {
  final newDefaultAddress = action.payload.address.copyWith(isDefault: true);
  final addresses = state.addresses.map(
    (e) {
      return e.addressId == newDefaultAddress.addressId
          ? newDefaultAddress
          : e.copyWith(isDefault: false);
    },
  ).toList();

  return state.copyWith(addresses: addresses);
}

CartState _setDefaultDeliverAddressSuccess(
  CartState state,
  SetDefaultDeliverAddressSuccessAction action,
) {
  return state;
}

CartState _setDefaultDeliverAddressFail(
  CartState state,
  SetDefaultDeliverAddressFailAction action,
) {
  final previousDefaultAddress = action.payload.previousAddress;
  final addresses = state.addresses.map(
    (e) {
      return e.addressId == previousDefaultAddress.addressId
          ? previousDefaultAddress.addressId
          : e.copyWith(isDefault: false);
    },
  ).toList();

  return state.copyWith(addresses: addresses);
}
