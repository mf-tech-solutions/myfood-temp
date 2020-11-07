import 'package:flutter/material.dart';

class ListWrapper extends StatelessWidget {
  final Widget child;

  const ListWrapper({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(24);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
      ),
      child: child,
    );
  }
}
