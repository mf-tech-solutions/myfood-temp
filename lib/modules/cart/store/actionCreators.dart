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
