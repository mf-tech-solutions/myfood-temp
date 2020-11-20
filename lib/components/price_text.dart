import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final double price;
  final TextStyle style;
  final TextOverflow overflow;
  final int maxLines;

  const PriceText({
    Key key,
    @required this.price,
    this.style,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'R\$ ${price.toStringAsFixed(2)}',
      style: style,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
