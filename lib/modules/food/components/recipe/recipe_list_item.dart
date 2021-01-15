import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../../models/recipe.dart';

class RecipeListItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeListItem({Key key, @required this.recipe}) : super(key: key);

  void goToRecipeDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(recipeRoute, arguments: recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Icon(Icons.menu_book_rounded),
            SizedBox(width: 8),
            Text(recipe.name),
          ],
        ),
        subtitle: Text(
          recipe.directions,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () => goToRecipeDetailScreen(context),
      ),
    );
  }
}
