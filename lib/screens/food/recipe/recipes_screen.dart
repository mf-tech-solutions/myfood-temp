import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../components/with_refresh_indicator.dart';
import '../../../modules/food/components/recipe/recipe_list.dart';
import '../../../modules/food/resource.dart';
import '../../../modules/food/store/action_creators.dart';

class RecipesScreen extends StatelessWidget {
  final String title = FoodResource.recipesTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: FoodResource.recipesTitle),
      body: WithRefreshIndicator(
        child: RecipeList(),
        onRefresh: fetchRecipes,
      ),
    );
  }
}
