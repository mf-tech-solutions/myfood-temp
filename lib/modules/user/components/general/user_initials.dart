import 'package:flutter/material.dart';

import '../../store/selectors.dart';

class UserInitials extends StatelessWidget {
  final Color color;

  UserInitials({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return Text(
      user.name.characters.elementAt(0),
      style: Theme.of(context).textTheme.headline5.copyWith(color: color),
    );
  }
}
