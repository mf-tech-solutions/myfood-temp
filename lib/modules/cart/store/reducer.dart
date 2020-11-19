import 'package:redux/redux.dart' show TypedReducer, combineReducers;

import 'selectors.dart';
import 'actions.dart';
import 'state.dart';
import '../models/cart_product.dart';

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
  TypedReducer(_setPaymentMethod)
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
  return state;
}

CartState _confirmOrderSuccess(
  CartState state,
  ConfirmOrderSuccessAction action,
) {
  return state.copyWith(products: []);
}

CartState _confirmOrderFail(CartState state, ConfirmOrderFailAction action) {
  return state;
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

CartState _setPaymentMethod(CartState state, SetPaymentMethodAction action) {
  return state.copyWith(paymentMethod: action.payload.paymentMethod);
}
