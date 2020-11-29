import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/cart/components/deliver_address_screens/add_deliver_address_form.dart';

class AddDeliverAddressScreen extends StatefulWidget {
  @override
  _AddDeliverAddressScreenState createState() =>
      _AddDeliverAddressScreenState();
}

class _AddDeliverAddressScreenState extends State<AddDeliverAddressScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'addAddressScreen');

  final _streetController = TextEditingController();
  final _streetNumberController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _complementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(title: 'Adicionar endereço'),
      body: AddDeliverAddressForm(
        streetController: _streetController,
        streetNumberController: _streetNumberController,
        zipCodeController: _zipCodeController,
        complementController: _complementController,
      ),
    );
  }
}
