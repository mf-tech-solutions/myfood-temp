import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../modules/cart/components/deliver_address_screens/add_deliver_address_form.dart';
import '../../../modules/cart/models/address.dart';

class AddDeliverAddressScreen extends StatelessWidget {
  final _streetController = TextEditingController();
  final _streetNumberController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _complementController = TextEditingController();

  final Address address;
  bool get isUpdate => address != null;

  AddDeliverAddressScreen({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '${isUpdate ? 'Atualizar' : 'Adicionar'} endereço',
        actions: isUpdate
            ? [
                TextButton(
                  child: Text(
                    'Remover',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ]
            : [],
      ),
      body: AddDeliverAddressForm(
        streetController: _streetController,
        streetNumberController: _streetNumberController,
        zipCodeController: _zipCodeController,
        complementController: _complementController,
        address: address,
      ),
    );
  }
}
