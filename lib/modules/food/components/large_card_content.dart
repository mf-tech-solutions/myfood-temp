import 'package:flutter/material.dart';

class LargeCardContent extends StatelessWidget {
  final Widget image;
  final String title;
  final Widget textContent;
  final Color textColor;

  const LargeCardContent({
    Key key,
    @required this.image,
    @required this.title,
    @required this.textContent,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final headerTextStyle = textColor == null
        ? textTheme.headline5
        : textTheme.headline5.copyWith(color: textColor);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 320, child: image),
        SizedBox(height: 24),
        Hero(
          tag: title,
          child: Text(
            title,
            style: headerTextStyle,
          ),
        ),
        SizedBox(height: 12),
        textContent,
      ],
    );
  }
}
