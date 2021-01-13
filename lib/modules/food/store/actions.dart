import 'package:MyFood/modules/food/models/category.dart';
import 'package:flutter/material.dart' show required;

import '../models/game.dart';
import '../models/product.dart';
import '../models/recipe.dart';

//region Fetch products
class FetchProductsAction {}

class FetchProductsSuccessPayload {
  final List<Product> products;
  final List<Category> categories;

  FetchProductsSuccessPayload(this.products, this.categories);
}

class FetchProductsSuccessAction {
  FetchProductsSuccessPayload payload;

  FetchProductsSuccessAction(
    List<Product> products,
    List<Category> categories,
  ) {
    payload = FetchProductsSuccessPayload(products, categories);
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
