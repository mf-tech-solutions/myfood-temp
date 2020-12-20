import 'package:flutter/material.dart';

import '../../models/recipe.dart';
import '../../resource.dart';
import '../general/large_card_content.dart';
import 'ingredient_view.dart';

class RecipeCardContent extends StatelessWidget {
  final Recipe recipe;
  final double wrapperPadding;

  const RecipeCardContent({
    Key key,
    @required this.recipe,
    this.wrapperPadding = 0,
  }) : super(key: key);

  double getAvailableWidth(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final availableWidth = (sizeWidth - 2 * wrapperPadding);
    return availableWidth;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final availableWidth = getAvailableWidth(context);

    return SizedBox(
      height: 400,
      width: availableWidth,
      child: LargeCardContent(
        image: Placeholder(),
        title: recipe.name,
        textContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FoodResource.ingredientsSectionTitle,
              style: textTheme.headline6,
            ),
            SizedBox(height: 12),
            Column(
              children: recipe.ingredients
                  .map((e) => IngredientView(ingredient: e))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              FoodResource.directionsSectionTitle,
              style: textTheme.headline6,
            ),
            SizedBox(height: 12),
            Text(
              recipe.directions,
            ),
          ],
        ),
      ),
    );
  }
}
