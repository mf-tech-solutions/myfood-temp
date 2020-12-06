import 'actions.dart';
import 'selectors.dart';
import '../service.dart';
import '../models/address.dart';
import '../models/card.dart';
import '../models/cart_product.dart';
import '../models/deliver_info.dart';
import '../models/order.dart';
import '../models/order_status.dart';
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

void placeOrder() {
  final state = AppStore.store.state.cartState;

  final order = Order(
    cartProducts: state.products,
    createdAt: null,
    deliverInfo: state.deliverInfo,
    finishedAt: null,
    orderId: null,
    paymentMethod: state.paymentMethod,
    status: OrderStatus.created,
    taxNumber: '60805766359',
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

Future<void> getDeliverAddressess() async {
  AppStore.store.dispatch(GetDeliverAddressessAction());

  try {
    final addresses = await CartService.getDeliverAddresses();
    AppStore.store.dispatch(GetDeliverAddressessSuccessAction(addresses));
  } catch (e) {
    AppStore.store.dispatch(GetDeliverAddressessFailAction());
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
