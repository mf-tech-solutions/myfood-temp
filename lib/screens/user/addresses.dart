import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/user/components/user_addresses_screen_content.dart';

class UserAddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Endereços',
      ),
      body: UserAddressesScreenContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
