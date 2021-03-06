import '../../../store/store.dart';
import '../service.dart';
import 'actions.dart';

Future<void> fetchProducts() async {
  AppStore.store.dispatch(FetchProductsAction());

  try {
    final categories = await FoodService.fetchCategories();
    final products = await FoodService.fetchProducts();
    AppStore.store.dispatch(FetchProductsSuccessAction(products, categories));
  } catch (e) {
    AppStore.store.dispatch(FetchProductsFailAction());
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
