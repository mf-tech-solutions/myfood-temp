import 'package:flutter/material.dart';

import '../components/app_drawer/app_drawer.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDrawer(),
    );
  }
}
