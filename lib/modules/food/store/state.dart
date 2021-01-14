import 'package:flutter/material.dart' show immutable, required;

import '../models/category.dart';
import '../models/game.dart';
import '../models/product.dart';
import '../models/recipe.dart';

@immutable
class FoodState {
  final List<Category> categories;

  final List<Product> products;
  final bool loadingProducts;

  final List<Recipe> recipes;
  final bool loadingRecipes;

  final List<FoodGame> games;
  final bool loadingGames;

  FoodState({
    @required this.categories,
    @required this.products,
    @required this.loadingProducts,
    @required this.recipes,
    @required this.loadingRecipes,
    @required this.games,
    @required this.loadingGames,
  });

  factory FoodState.initial() => FoodState(
        categories: [],
        products: [],
        loadingProducts: false,
        recipes: [],
        loadingRecipes: false,
        games: [],
        loadingGames: false,
      );

  FoodState copyWith({
    List<Category> categories,
    List<Product> products,
    bool loadingProducts,
    List<Recipe> recipes,
    bool loadingRecipes,
    List<FoodGame> games,
    bool loadingGames,
  }) {
    return FoodState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      loadingProducts: loadingProducts ?? this.loadingProducts,
      recipes: recipes ?? this.recipes,
      loadingRecipes: loadingRecipes ?? this.loadingRecipes,
      games: games ?? this.games,
      loadingGames: loadingGames ?? this.loadingGames,
    );
  }

  @override
  bool operator ==(Object other) {
    final otherState = other as FoodState;
    return categories.length == otherState.categories.length &&
        products.length == otherState.products.length &&
        loadingProducts == otherState.loadingProducts &&
        recipes.length == otherState.recipes.length &&
        loadingRecipes == otherState.loadingRecipes &&
        games.length == otherState.games.length &&
        loadingGames == otherState.loadingGames;
  }

  @override
  int get hashCode => super.hashCode;
}
