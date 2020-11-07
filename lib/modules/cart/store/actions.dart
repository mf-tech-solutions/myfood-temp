import 'package:flutter/material.dart' show immutable, required;
import '../../food/models/product.dart';
import '../models/cart_product.dart';

//region Add to cart
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

//region Confirm order
class ConfirmOrderAction {}

class ConfirmOrderSuccessAction {}

class ConfirmOrderFailAction {}
//endregion
