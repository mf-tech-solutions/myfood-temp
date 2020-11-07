import 'package:flutter/material.dart';

import '../../food/models/product.dart';
import '../resource.dart';

class ProductCounter extends StatelessWidget {
  final IProduct product;
  final int amount;

  final Function add;
  final Function subtract;
  final Function remove;

  const ProductCounter({
    Key key,
    @required this.product,
    @required this.amount,
    @required this.add,
    @required this.subtract,
    this.remove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
