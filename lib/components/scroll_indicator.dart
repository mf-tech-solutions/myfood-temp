import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  final double height = 6;

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).dividerColor;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
      child: Container(
        height: height,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height),
          color: dividerColor,
        ),
      ),
    );
  }
}
