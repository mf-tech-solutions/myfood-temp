import 'package:flutter/material.dart';

import 'recipe_card_content.dart';
import '../../models/recipe.dart';
import '../../../../utils.dart';

class RecipeListItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeListItem({Key key, @required this.recipe}) : super(key: key);

  void openGameModal(BuildContext context) {
    Utils.showContentOnlyDialog(
      context: context,
      child: RecipeCardContent(
        recipe: recipe,
        wrapperPadding: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Hero(
          tag: recipe.name,
          child: Row(
            children: [
              Icon(Icons.menu_book_rounded),
              SizedBox(width: 8),
              Text(recipe.name),
            ],
          ),
        ),
        subtitle: Hero(
          tag: '${recipe.name} + ${recipe.id}',
          child: Text(
            recipe.directions,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        onTap: () => openGameModal(context),
      ),
    );
  }
}
