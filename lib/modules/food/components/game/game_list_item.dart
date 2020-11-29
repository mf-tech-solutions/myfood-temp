import 'package:flutter/material.dart';

import 'game_card_content.dart';
import '../../models/game.dart';
import '../../../../utils.dart';

class GameListItem extends StatelessWidget {
  final FoodGame game;

  const GameListItem({Key key, @required this.game}) : super(key: key);

  void openGameModal(BuildContext context) {
    Utils.showContentOnlyDialog(
      context: context,
      child: GameCardContent(
        game: game,
        wrapperPadding: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Icon(Icons.videogame_asset_rounded),
            SizedBox(width: 8),
            Text(game.name),
          ],
        ),
        subtitle: Text(
          game.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () => openGameModal(context),
      ),
    );
  }
}
