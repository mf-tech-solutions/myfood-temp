import 'package:flutter/material.dart' show required;

import '../models/game.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../models/recipe.dart';

//region Fetch categories
class FetchCategoriesAction {}

class FetchCategoriesSuccessPayload {
  final List<Category> categories;

  FetchCategoriesSuccessPayload({@required this.categories});
}

class FetchCategoriesSuccessAction {
  FetchCategoriesSuccessPayload payload;

  FetchCategoriesSuccessAction({@required List<Category> categories}) {
    payload = FetchCategoriesSuccessPayload(categories: categories);
  }
}

class FetchCategoriesFailAction {}
//endregion

//region Fetch products
class FetchProductsAction {}

class FetchProductsSuccessPayload {
  final List<Product> products;

  FetchProductsSuccessPayload({@required this.products});
}

class FetchProductsSuccessAction {
  FetchProductsSuccessPayload payload;

  FetchProductsSuccessAction({@required List<Product> products}) {
    payload = FetchProductsSuccessPayload(products: products);
  }
}

class FetchProductsFailAction {}
//endregion

//region Fetch recipes
class FetchRecipesAction {}

class FetchRecipesSuccessPayload {
  final List<Recipe> recipes;

  FetchRecipesSuccessPayload({@required this.recipes});
}

class FetchRecipesSuccessAction {
  FetchRecipesSuccessPayload payload;

  FetchRecipesSuccessAction({@required List<Recipe> recipes}) {
    payload = FetchRecipesSuccessPayload(recipes: recipes);
  }
}

class FetchRecipesFailAction {}
//endregion

//region Fetch games
class FetchGamesAction {}

class FetchGamesSuccessPayload {
  final List<FoodGame> games;

  FetchGamesSuccessPayload(this.games);
}

class FetchGamesSuccessAction {
  FetchGamesSuccessPayload payload;

  FetchGamesSuccessAction({@required List<FoodGame> games}) {
    payload = FetchGamesSuccessPayload(games);
  }
}

class FetchGamesFailAction {}
//endregion
