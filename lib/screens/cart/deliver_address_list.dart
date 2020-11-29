import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/cart/components/deliver_address_screens/deliver_addresses_screen_content.dart';
import '../../routes.dart';

class DeliverAddressListScreen extends StatefulWidget {
  @override
  _DeliverAddressListScreenState createState() =>
      _DeliverAddressListScreenState();
}

class _DeliverAddressListScreenState extends State<DeliverAddressListScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'userAddressList');

  void openAddAddressForm(BuildContext context) {
    Navigator.of(context).pushNamed(deliverAddAddressRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(title: 'Endereços'),
      body: DeliverAddressesScreenContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openAddAddressForm(context),
      ),
    );
  }
}
