import 'package:MyFood/modules/cart/models/payment_method.dart';

import 'actions.dart';
import '../service.dart';
import '../models/cart_product.dart';
import '../../food/models/product.dart';
import '../../../store/store.dart';

void addProductToCart(CartProduct product) {
  AppStore.store.dispatch(AddItemsToCartAction(product: product));
}

void removeFromCart(Product product) {
  AppStore.store.dispatch(RemoveFromCartAction(product: product));
}

void clearCart() {
  AppStore.store.dispatch(ClearCartAction());
}

void toggleDeliverOption() {
  AppStore.store.dispatch(ToggleDeliverOption());
}

Future<void> confirmOrder() async {
  AppStore.store.dispatch(ConfirmOrderAction());

  try {
    await CartService.confirmOrder();
    AppStore.store.dispatch(ConfirmOrderSuccessAction());
  } catch (e) {
    AppStore.store.dispatch(ConfirmOrderFailAction());
  }
}

Future<void> getUserCards() async {
  AppStore.store.dispatch(GetUserCardsAction());

  try {
    final userId = AppStore.store.state.authState.user.userId;
    final cards = await CartService.getUserCards(userId);
    AppStore.store.dispatch(GetUserCardsSuccessAction(cards));
  } catch (e) {
    AppStore.store.dispatch(GetUserCardsFailAction());
  }
}

void setPaymentMethod(PaymentMethod paymentMethod) {
  AppStore.store.dispatch(SetPaymentMethodAction(paymentMethod));
}
