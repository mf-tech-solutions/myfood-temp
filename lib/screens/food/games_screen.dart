import 'package:flutter/material.dart';

import '../../modules/food/components/game/game_list.dart';
import '../../modules/food/resource.dart';
import '../../components/app_bar/app_bar.dart';

class GamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: FoodResource.gamesTitle,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: GameList(),
    );
  }
}
