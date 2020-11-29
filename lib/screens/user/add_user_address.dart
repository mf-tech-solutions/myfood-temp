import 'package:MyFood/components/app_bar/app_bar.dart';
import 'package:MyFood/modules/navigation/store/actionCreators.dart';
import 'package:MyFood/modules/user/components/user_address_screens/add_user_address_form.dart';
import 'package:flutter/material.dart';

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
  void dispose() {
    updateRootScaffoldKey(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateRootScaffoldKey(_scaffoldKey);

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
