import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../modules/food/models/game.dart';

class GameScreen extends StatelessWidget {
  final FoodGame game;

  const GameScreen({Key key, @required this.game}) : super(key: key);

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
            game.name,
            style: titleTextStyle,
          ),
          SizedBox(height: 12),
          Text(game.description),
        ],
      ),
    );
  }
}
