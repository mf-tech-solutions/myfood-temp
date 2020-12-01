import 'package:flutter/material.dart';

import '../../components/with_refresh_indicator.dart';
import '../../components/app_bar/app_bar.dart';
import '../../modules/food/resource.dart';
import '../../modules/food/components/game/game_list.dart';
import '../../modules/food/store/action_creators.dart';

class GamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: FoodResource.gamesTitle,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: WithRefreshIndicator(
        child: GameList(),
        onRefresh: fetchGames,
      ),
    );
  }
}
