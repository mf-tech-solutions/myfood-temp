import 'actions.dart';
import '../service.dart';
import '../../../store/store.dart';

Future<void> fetchCategories() async {
  AppStore.store.dispatch(FetchCategoriesAction());

  try {
    final categories = await FoodService.fetchCategories();
    AppStore.store
        .dispatch(FetchCategoriesSuccessAction(categories: categories));
  } catch (e) {
    AppStore.store.dispatch(FetchCategoriesFailAction());
  }
}

Future<void> fetchProducts() async {
  AppStore.store.dispatch(FetchProductsAction());

  try {
    final products = await FoodService.fetchProducts();
    AppStore.store.dispatch(FetchProductsSuccessAction(products: products));
  } catch (e) {
    AppStore.store.dispatch(FetchCategoriesFailAction());
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
