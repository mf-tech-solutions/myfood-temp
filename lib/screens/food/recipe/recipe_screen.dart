import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../modules/food/models/recipe.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeScreen({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleTextStyle = textTheme.headline5;

    return Scaffold(
      appBar: MyAppBar(
        title: '',
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 24),
        children: [
          SizedBox(height: 320, child: Placeholder()),
          SizedBox(height: 24),
          Text(
            recipe.name,
            style: titleTextStyle,
          ),
          SizedBox(height: 12),
          Text(recipe.directions),
        ],
      ),
    );
  }
}
