import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/user/components/user_address_screens/user_addresses_screen_content.dart';
import '../../routes.dart';

class UserAddressListScreen extends StatefulWidget {
  @override
  _UserAddressListScreenState createState() => _UserAddressListScreenState();
}

class _UserAddressListScreenState extends State<UserAddressListScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'userAddressList');

  void openAddAddressForm(BuildContext context) {
    Navigator.of(context).pushNamed(userAddAddressRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(title: 'Endereços'),
      body: UserAddressesScreenContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openAddAddressForm(context),
      ),
    );
  }
}
