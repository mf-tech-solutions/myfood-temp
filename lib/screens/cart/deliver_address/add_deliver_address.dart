import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../components/screen_icon_avatar.dart';
import '../../../modules/cart/components/deliver_address_screens/add_deliver_address_form.dart';
import '../../../modules/cart/models/address.dart';
import '../../../modules/cart/utils.dart';

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
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          ScreenIconAvatar(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset('${Utils.imagesPath}deliver_address.svg'),
            ),
          ),
          SizedBox(height: 24),
          AddDeliverAddressForm(
            streetController: _streetController,
            streetNumberController: _streetNumberController,
            zipCodeController: _zipCodeController,
            complementController: _complementController,
            address: address,
          ),
        ],
      ),
    );
  }
}
