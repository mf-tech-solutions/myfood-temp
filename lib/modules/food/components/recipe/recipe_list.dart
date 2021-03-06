import 'package:MyFood/modules/cart/components/general/scrollable_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../constants.dart';
import '../../../../store/state.dart';
import '../../models/recipe.dart';
import '../../resource.dart';
import '../../store/action_creators.dart';
import '../../store/state.dart';
import 'recipe_list_item.dart';

class RecipeList extends StatelessWidget {
  Widget getRecipesView(List<Recipe> recipes) {
    if (recipes.length == 0)
      return ScrollableCenter(
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
      onInitialBuild: (state) {
        if (state.recipes.length == 0) {
          fetchRecipes();
        }
      },
      distinct: true,
      converter: (store) => store.state.foodState,
      builder: (_, state) {
        final loader = ScrollableCenter(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          ),
        );

        final content = AnimatedCrossFade(
          firstChild: loader,
          secondChild: getRecipesView(state.recipes),
          crossFadeState: state.loadingRecipes
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Constants.widgetTransitionDuration,
        );

        return FutureBuilder(
          future: Future.delayed(Constants.pageTransitionDuration),
          builder: (_, __) {
            return content;
          },
        );
      },
    );
  }
}
