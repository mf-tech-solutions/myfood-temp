import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import 'game_list_item.dart';
import '../../resource.dart';
import '../../models/game.dart';
import '../../store/action_creators.dart';
import '../../store/state.dart';
import '../../../../constants.dart';
import '../../../../store/state.dart';

class GameList extends StatelessWidget {
  Widget getGamesView(List<FoodGame> games) {
    if (games.length == 0)
      return Center(
        child: Text(
          FoodResource.emptyGameList,
          style: TextStyle(color: Colors.white),
        ),
      );

    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemBuilder: (context, index) => itemBuilder(games[index]),
      separatorBuilder: (context, index) => separatorBuilder(),
      itemCount: games.length,
    );
  }

  Widget itemBuilder(FoodGame game) {
    return GameListItem(game: game);
  }

  Widget separatorBuilder() {
    return SizedBox(height: 12);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FoodState>(
      converter: (store) => store.state.foodState,
      builder: (_, state) {
        if (state.games.length == 0) fetchGames();

        final loader = Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );

        return AnimatedCrossFade(
          firstChild: loader,
          secondChild: getGamesView(state.games),
          crossFadeState: state.loadingGames
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Constants.widgetTransitionDuration,
        );
      },
    );
  }
}
