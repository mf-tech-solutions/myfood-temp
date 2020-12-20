import 'package:flutter/material.dart';

class ScrollableCenter extends StatelessWidget {
  final Widget child;

  const ScrollableCenter({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: child),
        )
      ],
    );
  }
}
