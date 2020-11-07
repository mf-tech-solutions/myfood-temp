import 'package:redux/redux.dart' show TypedReducer, combineReducers;
import 'selectors.dart';
import 'actions.dart';
import 'state.dart';
import '../models/cart_product.dart';

final cartReducer = combineReducers<CartState>([
  TypedReducer<CartState, AddItemsToCartAction>(_addItemsToCart),
  TypedReducer<CartState, RemoveFromCartAction>(_removeFromCart),
  TypedReducer<CartState, ClearCartAction>(_clearCart),
  TypedReducer<CartState, ConfirmOrderAction>(_confirmOrderStart),
  TypedReducer<CartState, ConfirmOrderSuccessAction>(_confirmOrderSuccess),
  TypedReducer<CartState, ConfirmOrderFailAction>(_confirmOrderFail),
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

CartState _clearCart(CartState state, ClearCartAction action) {
  return state.copyWith(products: []);
}

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
