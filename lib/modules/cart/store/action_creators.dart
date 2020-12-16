import '../../../store/store.dart';
import '../../food/models/product.dart';
import '../models/address.dart';
import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/deliver_type.dart';
import '../models/order.dart';
import '../models/order_status.dart';
import '../models/payment_method.dart';
import '../service.dart';
import 'actions.dart';
import 'selectors.dart';

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

Future<void> updateUserCard(UserCardDto cardDto) async {
  AppStore.store.dispatch(UpdateUserCardAction());

  try {
    final card = await CartService.updateCard(cardDto);
    AppStore.store.dispatch(UpdateUserCardSuccessAction(card));
  } catch (e) {
    AppStore.store.dispatch(UpdateUserCardFailAction());
  }
}

Future<void> removeUserCard(int cardId) async {
  AppStore.store.dispatch(RemoveUserCardAction());

  try {
    await CartService.removeUserCard(cardId);
    AppStore.store.dispatch(RemoveUserCardSuccessAction(cardId));
  } catch (e) {
    AppStore.store.dispatch(RemoveUserCardFailAction());
    throw e;
  }
}

void clearCart() {
  AppStore.store.dispatch(ClearCartAction());
}

void placeOrder() {
  final state = AppStore.store.state.cartState;

  final order = Order(
    cartProducts: state.products,
    createdAt: null,
    deliverInfo: DeliverInfo(
      address: getDefaultDeliverAddress(),
      deliverType:
          state.isDeliver ? DeliverType.deliver : DeliverType.withdrawal,
    ),
    finishedAt: null,
    orderId: null,
    paymentMethod: state.paymentMethod,
    status: OrderStatus.created,
    socialIdInNote: state.socialIdInNote,
  );

  AppStore.store.dispatch(PlaceOrderAction(order));

  try {
    final stream = CartService.placeOrder(order);
    stream.listen((order) {
      AppStore.store.dispatch(PlaceOrderSuccessAction(order));
    });
  } catch (e) {
    AppStore.store.dispatch(PlaceOrderFailAction(order));
  }
}

Future<void> getOrderList() async {
  AppStore.store.dispatch(GetOrderListAction());
  try {
    final orderList = await CartService.getOrderList();
    AppStore.store.dispatch(GetOrderListSuccessAction(orderList));
  } catch (e) {
    AppStore.store.dispatch(GetOrderListFailAction());
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

void setSocialIdInNote(bool includeSocialIdInNote, String socialId) {
  AppStore.store.dispatch(SetSocialIdInNoteAction(
    includeSocialIdInNote,
    socialId,
  ));
}

void toggleDeliverOption() {
  AppStore.store.dispatch(ToggleDeliverOption());
}

Future<void> getDeliverAddresses() async {
  AppStore.store.dispatch(GetDeliverAddressesAction());

  try {
    final addresses = await CartService.getDeliverAddresses();
    AppStore.store.dispatch(GetDeliverAddressesSuccessAction(addresses));
  } catch (e) {
    AppStore.store.dispatch(GetDeliverAddressesFailAction());
  }
}

Future<void> addDeliverAddress(Address address) async {
  AppStore.store.dispatch(AddDeliverAddressAction());

  try {
    await CartService.addDeliverAddress();
    AppStore.store.dispatch(AddDeliverAddressSuccessAction(address));
  } catch (e) {
    AppStore.store.dispatch(AddDeliverAddressFailAction());
  }
}

Future<void> setDefaultDeliverAddress(Address address) async {
  final previousDefaultAddress = getDefaultDeliverAddress();

  AppStore.store.dispatch(SetDefaultDeliverAddressAction(address));

  try {
    await CartService.setDefaultDeliverAddress(address);
    AppStore.store.dispatch(SetDefaultDeliverAddressSuccessAction());
  } catch (e) {
    AppStore.store.dispatch(
      SetDefaultDeliverAddressFailAction(previousDefaultAddress),
    );
  }
}
