import 'package:flutter/material.dart';
import 'app_drawer/app_drawer.dart';

class IndexedScreen extends StatelessWidget {
  final Widget screen;

  IndexedScreen({
    Key key,
    @required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: AppDrawer()),
      endDrawer: Drawer(child: AppDrawer()),
      body: screen,
    );
  }
}
