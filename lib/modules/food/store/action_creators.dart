import 'package:redux/redux.dart' show Store;

import 'actions.dart';
import '../service.dart';
import '../../../store/state.dart';
import '../../../store/store.dart';

Future<void> fetchCategories(Store<AppState> store) async {
  store.dispatch(FetchCategoriesAction());

  try {
    final categories = await FoodService.fetchCategories();
    store.dispatch(FetchCategoriesSuccessAction(categories: categories));
  } catch (e) {
    store.dispatch(FetchCategoriesFailAction());
  }
}

Future<void> fetchProducts(Store<AppState> store) async {
  store.dispatch(FetchProductsAction());

  try {
    final products = await FoodService.fetchProducts();
    store.dispatch(FetchProductsSuccessAction(products: products));
  } catch (e) {
    store.dispatch(FetchCategoriesFailAction());
  }
}

Future<void> fetchRecipes() async {
  AppStore.store.dispatch(FetchRecipesAction());

  try {
    final recipes = await FoodService.fetchRecipes();
    AppStore.store.dispatch(FetchRecipesSuccessAction(recipes: recipes));
  } catch (e) {
    AppStore.store.dispatch(FetchRecipesFailAction());
  }
}

Future<void> fetchGames() async {
  AppStore.store.dispatch(FetchGamesAction());

  try {
    final games = await FoodService.fetchGames();
    AppStore.store.dispatch(
      FetchGamesSuccessAction(games: games),
    );
  } catch (e) {
    AppStore.store.dispatch(FetchGamesFailAction());
  }
}
