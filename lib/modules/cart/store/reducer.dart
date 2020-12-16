import 'package:redux/redux.dart' show TypedReducer, combineReducers;

import '../models/cart_product.dart';
import 'actions.dart';
import 'selectors.dart';
import 'state.dart';

final cartReducer = combineReducers<CartState>([
  TypedReducer(_addItemsToCart),
  TypedReducer(_removeFromCart),
  TypedReducer(_clearCart),
  TypedReducer(_toggleDeliverOption),
  TypedReducer(_placeOrderStart),
  TypedReducer(_placeOrderSuccess),
  TypedReducer(_placeOrderFail),
  TypedReducer(_getOrderListStart),
  TypedReducer(_getOrderListSuccess),
  TypedReducer(_getOrderListFail),
  TypedReducer(_getUserCardsStart),
  TypedReducer(_getUserCardsSuccess),
  TypedReducer(_getUserCardsFail),
  TypedReducer(_addUserCardStart),
  TypedReducer(_addUserCardSuccess),
  TypedReducer(_addUserCardFail),
  TypedReducer(_updateUserCardStart),
  TypedReducer(_updateUserCardSuccess),
  TypedReducer(_updateUserCardFail),
  TypedReducer(_removeUserCardStart),
  TypedReducer(_removeUserCardSuccess),
  TypedReducer(_removeUserCardFail),
  TypedReducer(_setPaymentMethod),
  TypedReducer(_setSocialIdInNote),
  TypedReducer(_setDeliverInfo),
  TypedReducer(_getDeliverAddressesStart),
  TypedReducer(_getDeliverAddressesSuccess),
  TypedReducer(_getDeliverAddressesFail),
  TypedReducer(_addDeliverAddressStart),
  TypedReducer(_addDeliverAddressSuccess),
  TypedReducer(_addDeliverAddressFail),
  TypedReducer(_setDefaultDeliverAddressStart),
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

CartState _clearCart(CartState state, ClearCartAction action) {
  return state.copyWith(products: []);
}

CartState _toggleDeliverOption(CartState state, ToggleDeliverOption action) {
  return state.copyWith(isDeliver: !state.isDeliver);
}

//region Place order
CartState _placeOrderStart(CartState state, PlaceOrderAction action) {
  final newOrder = action.payload.order;
  final orderList = [...state.orderList].toList();
  orderList.insert(0, newOrder);

  return state.copyWith(
    currentOrder: newOrder,
    orderList: orderList,
  );
}

CartState _placeOrderSuccess(
  CartState state,
  PlaceOrderSuccessAction action,
) {
  final order = action.payload.order;
  final orderList = state.orderList.map((x) {
    if (x.orderId == null || x.orderId == order.orderId) {
      return order;
    }
    return x;
  }).toList();

  return state.copyWith(
    products: [],
    currentOrder: order,
    orderList: orderList,
  );
}

CartState _placeOrderFail(CartState state, PlaceOrderFailAction action) {
  final order = action.payload.order;
  final orderList = state.orderList.map((x) {
    if (x.orderId == null || x.orderId == order.orderId) {
      return order;
    }
    return x;
  }).toList();

  return CartState.noOrder(
    currentState: state.copyWith(
      currentOrder: order,
      orderList: orderList,
    ),
  );
}
//endregion

//region Get order list
CartState _getOrderListStart(CartState state, GetOrderListAction action) {
  return state;
}

CartState _getOrderListSuccess(
  CartState state,
  GetOrderListSuccessAction action,
) {
  return state.copyWith(
    orderList: action.payload.orderList,
  );
}

CartState _getOrderListFail(
  CartState state,
  GetOrderListFailAction action,
) {
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
  return state.copyWith(loadingCards: true);
}

CartState _addUserCardSuccess(
  CartState state,
  AddUserCardSuccessAction action,
) {
  final cards = [...state.cards, action.payload.card];

  return state.copyWith(cards: cards, loadingCards: false);
}

CartState _addUserCardFail(
  CartState state,
  AddUserCardFailAction action,
) {
  return state.copyWith(loadingCards: false);
}
//endregion

//region Update user card
CartState _updateUserCardStart(CartState state, UpdateUserCardAction action) {
  return state.copyWith(loadingCards: true);
}

CartState _updateUserCardSuccess(
  CartState state,
  UpdateUserCardSuccessAction action,
) {
  final updatedCard = action.payload.card;
  final cards = state.cards
      .map(
        (x) => x.id == updatedCard.id ? updatedCard : x,
      )
      .toList();

  return state.copyWith(cards: cards, loadingCards: false);
}

CartState _updateUserCardFail(
  CartState state,
  UpdateUserCardFailAction action,
) {
  return state.copyWith(loadingCards: false);
}
//endregion

//region Remove user card
CartState _removeUserCardStart(CartState state, RemoveUserCardAction action) {
  return state.copyWith(loadingCards: true);
}

CartState _removeUserCardSuccess(
  CartState state,
  RemoveUserCardSuccessAction action,
) {
  final cardList = state.cards
      .where(
        (x) => x.id != action.payload.cardId,
      )
      .toList();

  return state.copyWith(cards: cardList, loadingCards: false);
}

CartState _removeUserCardFail(
    CartState state, RemoveUserCardFailAction action) {
  return state.copyWith(loadingCards: false);
}
//endregion

CartState _setDeliverInfo(CartState state, SetDeliverInfoAction action) {
  return state.copyWith(deliverInfo: action.payload.deliverInfo);
}

CartState _setPaymentMethod(CartState state, SetPaymentMethodAction action) {
  return state.copyWith(paymentMethod: action.payload.paymentMethod);
}

CartState _setSocialIdInNote(CartState state, SetSocialIdInNoteAction action) {
  return state.copyWith(
    includeSocialIdInNote: action.payload.includeSocialIdInNote,
    socialIdInNote: action.payload.socialId,
  );
}

//region Get deliver addresses
CartState _getDeliverAddressesStart(
  CartState state,
  GetDeliverAddressesAction action,
) {
  return state.copyWith(loadingAddresses: true);
}

CartState _getDeliverAddressesSuccess(
  CartState state,
  GetDeliverAddressesSuccessAction action,
) {
  return state.copyWith(
    loadingAddresses: false,
    addresses: action.payload.addresses,
  );
}

CartState _getDeliverAddressesFail(
  CartState state,
  GetDeliverAddressesFailAction action,
) {
  return state.copyWith(loadingAddresses: false);
}
//endregion

//region Add deliver address
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
//endregion

//region Set default deliver address
CartState _setDefaultDeliverAddressStart(
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
//endregion
