import '../../../store/store.dart';
import '../models/product.dart';

List<Product> getProductsByCategory(int categoryId) {
  return AppStore.store.state.foodState.products
      .where((prod) => prod.categoryId == categoryId)
      .toList();
}
