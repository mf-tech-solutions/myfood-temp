import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  final int amount;

  final Function add;
  final Function subtract;

  const ProductCounter({
    Key key,
    @required this.amount,
    @required this.add,
    @required this.subtract,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle),
          color: primaryColor,
          onPressed: amount > 0 ? subtract : null,
        ),
        SizedBox(width: 8),
        Text(
          '$amount',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: 8),
        IconButton(
          icon: Icon(
            Icons.add_circle,
          ),
          color: primaryColor,
          onPressed: add,
        ),
      ],
    );
  }
}
