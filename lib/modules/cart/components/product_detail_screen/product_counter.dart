import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  final int amount;

  final Function add;
  final Function subtract;

  final bool small;

  ProductCounter({
    Key key,
    @required this.amount,
    @required this.add,
    @required this.subtract,
    this.small = false,
  }) : super(key: key);

  List<Widget> _buildChildren(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final removeButtonOnPressed = amount > 0 ? subtract : null;

    if (small) {
      return [
        IconButton(
          icon: Icon(Icons.remove),
          iconSize: 18,
          color: primaryColor,
          onPressed: removeButtonOnPressed,
        ),
        SizedBox(width: 4),
        Text(
          '$amount',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: 4),
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 18,
          color: primaryColor,
          onPressed: add,
        ),
      ];
    }

    return [
      IconButton(
        icon: Icon(Icons.remove_circle),
        color: primaryColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: amount > 0 ? subtract : null,
      ),
      SizedBox(width: 8),
      Text(
        '$amount',
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(width: 8),
      IconButton(
        icon: Icon(Icons.add_circle),
        color: primaryColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: add,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _buildChildren(context),
    );
  }
}
