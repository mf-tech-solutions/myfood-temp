import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final List<Widget> actions;

  MyAppBar({
    Key key,
    this.title,
    this.actions,
  })  : preferredSize = Size.fromHeight(54),
        super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'myFood'),
      centerTitle: true,
      elevation: 0,
      actions: actions,
    );
  }
}
