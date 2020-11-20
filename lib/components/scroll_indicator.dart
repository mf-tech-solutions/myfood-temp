import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  final double height = 6;

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).dividerColor;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: dividerColor,
          borderRadius: BorderRadius.circular(height),
        ),
      ),
    );
  }
}
