import 'package:flutter/material.dart' show immutable, required;

import '../models/game.dart';
import '../models/recipe.dart';
import '../models/product.dart';
import '../models/category.dart';

@immutable
class FoodState {
  final List<Category> categories;
  final bool loadingCategories;

  final List<Product> products;
  final bool loadingProducts;

  final List<Recipe> recipes;
  final bool loadingRecipes;

  final List<FoodGame> games;
  final bool loadingGames;

  FoodState({
    @required this.categories,
    @required this.loadingCategories,
    @required this.products,
    @required this.loadingProducts,
    @required this.recipes,
    @required this.loadingRecipes,
    @required this.games,
    @required this.loadingGames,
  });

  factory FoodState.initial() => FoodState(
        categories: [],
        loadingCategories: false,
        products: [],
        loadingProducts: false,
        recipes: [],
        loadingRecipes: false,
        games: [],
        loadingGames: false,
      );

  FoodState copyWith({
    List<Category> categories,
    bool loadingCategories,
    List<Product> products,
    bool loadingProducts,
    List<Recipe> recipes,
    bool loadingRecipes,
    List<FoodGame> games,
    bool loadingGames,
  }) {
    return FoodState(
      categories: categories ?? this.categories,
      loadingCategories: loadingCategories ?? this.loadingCategories,
      products: products ?? this.products,
      loadingProducts: loadingProducts ?? this.loadingProducts,
      recipes: recipes ?? this.recipes,
      loadingRecipes: loadingRecipes ?? this.loadingRecipes,
      games: games ?? this.games,
      loadingGames: loadingGames ?? this.loadingGames,
    );
  }
}
