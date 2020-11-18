import 'package:MyFood/modules/cart/models/card.dart';

import '../models/cart_product.dart';
import '../models/payment_method.dart';
import '../models/payment_mothod_type.dart';
import '../../../store/store.dart';

CartProduct getCartProductByProductId(int productId) {
  return AppStore.store.state.cartState.products.firstWhere(
    (element) => element.product.id == productId,
    orElse: () => null,
  );
}

int getProductAmountInCart(int productId) {
  final cartProduct = getCartProductByProductId(productId);
  if (cartProduct == null) return 0;
  return cartProduct.amount;
}

UserCard getCardById({int cardId}) {
  if (cardId == null) return null;
  return AppStore.store.state.cartState.cards?.firstWhere(
    (card) => card.id == cardId,
    orElse: () => null,
  );
}

PaymentMethod getSelectedPaymentMethod() {
  return AppStore.store.state.cartState.paymentMethod;
}

bool isCardSelectedPaymentMethod(int cardId) {
  final selectedPaymentMethod = getSelectedPaymentMethod();
  return selectedPaymentMethod.type == PaymentMethodType.CARD &&
      selectedPaymentMethod.cardId == cardId;
}
