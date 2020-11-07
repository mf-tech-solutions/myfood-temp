import 'package:flutter/material.dart';

class PrimaryItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTapHandler;

  const PrimaryItem({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return TextButton.icon(
      icon: Icon(
        icon,
        color: primaryColor,
      ),
      label: Text(
        text,
        style: TextStyle(color: primaryColor),
      ),
      onPressed: () => onTapHandler(context),
    );
  }
}
