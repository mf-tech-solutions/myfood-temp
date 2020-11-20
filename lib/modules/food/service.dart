import 'dart:math';

import '../../constants.dart' show Constants;

import 'models/game.dart';
import 'models/ingredient.dart';
import 'models/recipe.dart';
import 'models/product.dart';
import 'models/category.dart';

final _foodImgUrl =
    'https://images.unsplash.com/photo-1432139555190-58524dae6a55?ixlib=rb-1.2.1&auto=format&fit=crop&w=1355&q=80';

class FoodService {
  static final _categories = [
    Category(id: 1, name: 'Almoço', imageUrl: _foodImgUrl),
    Category(id: 2, name: 'Carnes', imageUrl: _foodImgUrl),
    Category(id: 3, name: 'Bebidas', imageUrl: _foodImgUrl),
  ];

  static String getImgUrl(Category category) {
    switch (category.name) {
      case 'Almoço':
        return 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/healthy-recipes-marquee-1577978180.png?crop=0.663xw:0.993xh;0.171xw,0&resize=640:*';

      case 'Carnes':
        return 'https://www.bamco.com/content/uploads/2019/07/iStock-857308908_red-and-white-meat_970y546.jpg';

      default:
        return 'https://www.comercialzaffari.com.br/r/w640-h480-c/recipe/148_1.png';
    }
  }

  static final List<Product> _products = List.generate(
    Random().nextInt(18) + 12,
    (index) {
      final random = Random();
      final category = _categories[random.nextInt(_categories.length)];
      return Product(
        id: index,
        categoryId: category.id,
        name: '${category.name} ${index + 1}',
        unitaryPrice: random.nextDouble() * 80,
        imageUrl: getImgUrl(category),
        description: Constants.loremIpsum,
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
          amount: Random().nextInt(3) + 1,
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
