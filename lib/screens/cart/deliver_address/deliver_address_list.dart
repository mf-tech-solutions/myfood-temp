import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../modules/cart/components/deliver_address_screens/deliver_addresses_screen_content.dart';
import '../../../routes.dart';

class DeliverAddressListScreen extends StatelessWidget {
  void openAddAddressForm(BuildContext context) {
    Navigator.of(context).pushNamed(deliverAddAddressRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Endereços'),
      body: DeliverAddressesScreenContent(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'address_list_fab',
        child: Icon(Icons.add),
        onPressed: () => openAddAddressForm(context),
      ),
    );
  }
}
