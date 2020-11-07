import 'dart:math';

import '../../constants.dart' show Constants;

import 'models/game.dart';
import 'models/ingredient.dart';
import 'models/recipe.dart';
import 'models/product.dart';
import 'models/category.dart';

class FoodService {
  static final _categories = [
    Category(id: 1, name: 'Almoço'),
    Category(id: 2, name: 'Carnes'),
    Category(id: 3, name: 'Bebidas'),
  ];

  static final List<Product> _products = List.generate(
    Random().nextInt(11) + 9,
    (index) {
      final random = Random();
      final category = _categories[random.nextInt(_categories.length)];
      return Product(
        id: index,
        categoryId: category.id,
        name: '${category.name} ${index + 1}',
        unitaryPrice: random.nextDouble() * 80,
      );
    },
  );

  static final List<Recipe> _recipes = List.generate(
    Random().nextInt(4) + 2,
    (index) => Recipe(
      id: index,
      name: 'Receita ${index + 1}',
      ingredients: List.generate(
        Random().nextInt(4) + 1,
        (index) => Ingredient(
          id: index,
          name: 'Ingrediente ${index + 1}',
          amount: Random().nextInt(6) + 1,
          measure: 'medida(s)',
        ),
      ),
      directions: 'Faça isso, depois aquilo e VRAU.',
    ),
  );

  static final List<FoodGame> _games = List.generate(
    Random().nextInt(4) + 2,
    (index) => FoodGame(
      id: index,
      name: 'Jogo ${index + 1}',
      description: Constants.loremIpsum,
    ),
  );

  static Future<List<Category>> fetchCategories() async {
    return Future.delayed(
      Duration(
        milliseconds: 400,
      ),
      () => _categories,
    );
  }

  static Future<List<Product>> fetchProducts() async {
    return Future.delayed(
      Duration(
        milliseconds: 400,
      ),
      () => _products,
    );
  }

  static Future<List<Recipe>> fetchRecipes() async {
    return Future.delayed(
      Duration(milliseconds: 600),
      () => _recipes,
    );
  }

  static Future<List<FoodGame>> fetchGames() async {
    return Future.delayed(
      Duration(milliseconds: 800),
      () => _games,
    );
  }
}
