import 'package:flutter/material.dart';

import '../../models/game.dart';
import '../general/large_card_content.dart';

class GameCardContent extends StatelessWidget {
  final FoodGame game;
  final double wrapperPadding;

  const GameCardContent({
    Key key,
    @required this.game,
    this.wrapperPadding = 0,
  }) : super(key: key);

  double getAvailableWidth(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final availableWidth = (sizeWidth - 2 * wrapperPadding);
    return availableWidth;
  }

  @override
  Widget build(BuildContext context) {
    final availableWidth = getAvailableWidth(context);

    return SizedBox(
      height: 400,
      width: availableWidth,
      child: LargeCardContent(
        image: Placeholder(),
        title: game.name,
        textContent: Text(
          game.description,
        ),
      ),
    );
  }
}
