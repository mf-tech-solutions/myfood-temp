import 'package:flutter/material.dart';

import '../../constants.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final List<Widget> actions;
  final Color backgroundColor;
  final bool centerTitle;
  final Color titleColor;
  final String title;

  MyAppBar({
    Key key,
    this.actions,
    this.backgroundColor,
    this.centerTitle = true,
    this.title,
    this.titleColor,
  })  : preferredSize = Size.fromHeight(54),
        super(key: key) {
    if (backgroundColor != null) {
      assert(titleColor != null);
    } else if (titleColor != null) {
      assert(backgroundColor != null);
    }
  }

  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Constants.scaffoldBackgroundColor;
    final titleStyle = TextStyle(
      color: backgroundColor == null ? Constants.blackTextColor : titleColor,
    );

    return AppBar(
      title: Text(
        title ?? 'myFood',
        style: titleStyle,
      ),
      centerTitle: centerTitle,
      elevation: 0,
      actions: actions,
      backgroundColor: bgColor,
    );
  }
}
