import 'package:flutter/material.dart';

class WithRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Function onRefresh;

  WithRefreshIndicator({@required this.child, @required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: child, onRefresh: onRefresh);
  }
}
