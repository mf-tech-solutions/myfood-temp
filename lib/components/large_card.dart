import 'package:flutter/material.dart';

class LargeCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  LargeCard({
    Key key,
    this.backgroundColor,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
