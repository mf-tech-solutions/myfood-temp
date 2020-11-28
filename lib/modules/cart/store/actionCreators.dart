import 'actions.dart';
import '../service.dart';
import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/payment_method.dart';
import '../../food/models/product.dart';
import '../../../store/store.dart';

void addProductToCart(CartProduct product) {
  AppStore.store.dispatch(AddItemsToCartAction(product: product));
}

Future<void> addUserCard(UserCardDto cardDto) async {
  AppStore.store.dispatch(AddUserCardAction());

  try {
    final card = await CartService.addUserCard(cardDto);
    AppStore.store.dispatch(AddUserCardSuccessAction(card));
  } catch (e) {
    AppStore.store.dispatch(AddUserCardFailAction());
  }
}

void clearCart() {
  AppStore.store.dispatch(ClearCartAction());
}

void confirmOrder() {
  AppStore.store.dispatch(ConfirmOrderAction());

  try {
    final stream = CartService.confirmOrder();
    stream.listen((status) {
      AppStore.store.dispatch(ConfirmOrderSuccessAction(status));
    });
  } catch (e) {
    AppStore.store.dispatch(ConfirmOrderFailAction());
  }
}

Future<void> getUserCards() async {
  AppStore.store.dispatch(GetUserCardsAction());

  try {
    final userId = AppStore.store.state.userState.user.userId;
    final cards = await CartService.getUserCards(userId);
    AppStore.store.dispatch(GetUserCardsSuccessAction(cards));
  } catch (e) {
    AppStore.store.dispatch(GetUserCardsFailAction());
  }
}

void removeFromCart(Product product) {
  AppStore.store.dispatch(RemoveFromCartAction(product: product));
}

void setDeliverInfo(DeliverInfo deliverInfo) {
  AppStore.store.dispatch(SetDeliverInfoAction(deliverInfo));
}

void setPaymentMethod(PaymentMethod paymentMethod) {
  AppStore.store.dispatch(SetPaymentMethodAction(paymentMethod));
}

void toggleDeliverOption() {
  AppStore.store.dispatch(ToggleDeliverOption());
}
