import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

final foodReducer = combineReducers<FoodState>([
  TypedReducer(_fetchProductsStart),
  TypedReducer(_fetchProductsSuccess),
  TypedReducer(_fetchProductsFail),
  TypedReducer(_fetchRecipesStart),
  TypedReducer(_fetchRecipesSuccess),
  TypedReducer(_fetchRecipesFail),
  TypedReducer(_fetchGamesStart),
  TypedReducer(_fetchGamesSuccess),
  TypedReducer(_fetchGamesFail),
]);

//region Fetch products
FoodState _fetchProductsStart(FoodState state, FetchProductsAction action) {
  return state.copyWith(loadingProducts: true);
}

FoodState _fetchProductsSuccess(
  FoodState state,
  FetchProductsSuccessAction action,
) {
  return state.copyWith(
    products: action.payload.products,
    categories: action.payload.categories,
    loadingProducts: false,
  );
}

FoodState _fetchProductsFail(
  FoodState state,
  FetchProductsFailAction action,
) {
  return state.copyWith(loadingProducts: false);
}
//endregion

//region Fetch recipes
FoodState _fetchRecipesStart(FoodState state, FetchRecipesAction action) {
  return state.copyWith(
    loadingRecipes: true,
  );
}

FoodState _fetchRecipesSuccess(
  FoodState state,
  FetchRecipesSuccessAction action,
) {
  return state.copyWith(
    loadingRecipes: false,
    recipes: action.payload.recipes,
  );
}

FoodState _fetchRecipesFail(
  FoodState state,
  FetchRecipesFailAction action,
) {
  return state.copyWith(
    loadingRecipes: false,
  );
}

//endregion

//region Fetch games
FoodState _fetchGamesStart(FoodState state, FetchGamesAction action) {
  return state.copyWith(loadingGames: true);
}

FoodState _fetchGamesSuccess(FoodState state, FetchGamesSuccessAction action) {
  return state.copyWith(loadingGames: false, games: action.payload.games);
}

FoodState _fetchGamesFail(FoodState state, FetchGamesFailAction action) {
  return state.copyWith(loadingGames: false);
}
//endregion
