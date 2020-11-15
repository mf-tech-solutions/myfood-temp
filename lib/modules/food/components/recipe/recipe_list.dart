import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'recipe_list_item.dart';
import '../../resource.dart';
import '../../models/recipe.dart';
import '../../store/action_creators.dart';
import '../../store/state.dart';
import '../../../../constants.dart';
import '../../../../store/state.dart';

class RecipeList extends StatelessWidget {
  Widget getRecipesView(List<Recipe> recipes) {
    if (recipes.length == 0)
      return Center(
        child: Text(
          FoodResource.emptyRecipeList,
          style: TextStyle(color: Colors.white),
        ),
      );

    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemBuilder: (context, index) => itemBuilder(recipes[index]),
      separatorBuilder: (context, index) => separatorBuilder(),
      itemCount: recipes.length,
    );
  }

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

        final loader = Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );

        return AnimatedCrossFade(
          firstChild: loader,
          secondChild: getRecipesView(state.recipes),
          crossFadeState: state.loadingRecipes
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Constants.widgetTransitionDuration,
        );
      },
    );
  }
}
