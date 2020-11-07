import '../models/cart_product.dart';
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
