import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/user/components/user_address_screens/add_user_address_form.dart';

class AddUserAddressScreen extends StatefulWidget {
  @override
  _AddUserAddressScreenState createState() => _AddUserAddressScreenState();
}

class _AddUserAddressScreenState extends State<AddUserAddressScreen> {
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
      body: AddUserAddressForm(
        streetController: _streetController,
        streetNumberController: _streetNumberController,
        zipCodeController: _zipCodeController,
        complementController: _complementController,
      ),
    );
  }
}
