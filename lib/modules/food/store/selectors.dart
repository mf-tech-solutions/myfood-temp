import '../../../store/store.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/search_result.dart';

List<Product> getProductsByCategory(int categoryId) {
  return AppStore.store.state.foodState.products
      .where((prod) => prod.categoryId == categoryId)
      .toList();
}

SearchResult search(String searchText) {
  final state = AppStore.store.state.foodState;

  final categories = state.categories
      .where(
        (x) => x.name.toLowerCase().contains(searchText),
      )
      .toList();
  categories.sort(
    (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
  );

  final products = state.products
      .where(
        (x) => x.name.toLowerCase().contains(searchText),
      )
      .toList();
  products.sort(
    (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
  );

  return SearchResult(
    categories: categories,
    products: products,
  );
}

List<Category> getCategories() {
  return AppStore.store.state.foodState.categories;
}

List<Product> getProducts() {
  return AppStore.store.state.foodState.products;
}

bool isLoadingFoodItems() {
  final state = AppStore.store.state.foodState;
  return state.loadingCategories || state.loadingProducts;
}
