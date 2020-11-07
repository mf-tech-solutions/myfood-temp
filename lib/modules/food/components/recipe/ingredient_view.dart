import 'package:flutter/material.dart';

import '../../models/ingredient.dart';

class IngredientView extends StatelessWidget {
  final Ingredient ingredient;
  final Color textColor;

  const IngredientView({
    Key key,
    @required this.ingredient,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: textColor);

    return Column(
      children: [
        Row(
          children: [
            Text(
              '${ingredient.amount} ',
              style: style,
            ),
            Text(
              '${ingredient.measure} de ',
              style: style,
            ),
            Text(
              ingredient.name,
              style: style,
            ),
          ],
        ),
        SizedBox(height: 8)
      ],
    );
  }
}
