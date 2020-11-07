import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'recipe_list_item.dart';
import '../../resource.dart';
import '../../models/recipe.dart';
import '../../store/action_creators.dart';
import '../../store/state.dart';
import '../../../../store/state.dart';

class RecipeList extends StatelessWidget {
  Widget itemBuilder(Recipe recipe) {
    return RecipeListItem(recipe: recipe);
  }

  Widget separatorBuilder() {
    return SizedBox(height: 12);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FoodState>(
      converter: (store) => store.state.foodState,
      builder: (_, state) {
        if (state.recipes.length == 0) fetchRecipes();

        if (state.loadingRecipes)
          return Center(child: CircularProgressIndicator());

        final recipes = state.recipes;

        if (recipes.length == 0)
          return Center(child: Text(FoodResource.emptyRecipeList));

        return ListView.separated(
          padding: const EdgeInsets.all(24),
          itemBuilder: (context, index) => itemBuilder(recipes[index]),
          separatorBuilder: (context, index) => separatorBuilder(),
          itemCount: recipes.length,
        );
      },
    );
  }
}
