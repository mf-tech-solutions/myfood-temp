import 'package:redux/redux.dart' show TypedReducer, combineReducers;
import 'actions.dart';
import 'state.dart';

final foodReducer = combineReducers<FoodState>([
  TypedReducer<FoodState, FetchCategoriesAction>(_fetchCategories),
  TypedReducer<FoodState, FetchCategoriesSuccessAction>(
      _fetchCategoriesSuccess),
  TypedReducer<FoodState, FetchCategoriesFailAction>(_fetchCategoriesFail),
  TypedReducer<FoodState, FetchProductsAction>(_fetchProducts),
  TypedReducer<FoodState, FetchProductsSuccessAction>(_fetchProductsSuccess),
  TypedReducer<FoodState, FetchProductsFailAction>(_fetchProductsFail),
  TypedReducer<FoodState, FetchRecipesAction>(_fetchRecipesStart),
  TypedReducer<FoodState, FetchRecipesSuccessAction>(_fetchRecipesSuccess),
  TypedReducer<FoodState, FetchRecipesFailAction>(_fetchRecipesFail),
  TypedReducer<FoodState, FetchGamesAction>(_fetchGamesStart),
  TypedReducer<FoodState, FetchGamesSuccessAction>(_fetchGamesSuccess),
  TypedReducer<FoodState, FetchGamesFailAction>(_fetchGamesFail),
]);

//region Fetch categories
FoodState _fetchCategories(FoodState state, FetchCategoriesAction action) =>
    state.copyWith(loadingCategories: true);

FoodState _fetchCategoriesSuccess(
        FoodState state, FetchCategoriesSuccessAction action) =>
    state.copyWith(
        categories: action.payload.categories, loadingCategories: false);

FoodState _fetchCategoriesFail(
        FoodState state, FetchCategoriesFailAction action) =>
    state.copyWith(loadingCategories: false);
//endregion

//region Fetch products
FoodState _fetchProducts(FoodState state, FetchProductsAction action) =>
    state.copyWith(loadingProducts: true);

FoodState _fetchProductsSuccess(
        FoodState state, FetchProductsSuccessAction action) =>
    state.copyWith(products: action.payload.products, loadingProducts: false);

FoodState _fetchProductsFail(FoodState state, FetchProductsFailAction action) =>
    state.copyWith(loadingProducts: false);
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
