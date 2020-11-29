import 'package:MyFood/routes.dart';
import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/user/components/user_address_screens/user_addresses_screen_content.dart';
import '../../modules/navigation/store/actionCreators.dart';

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
  void dispose() {
    updateRootScaffoldKey(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateRootScaffoldKey(_scaffoldKey);

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
