import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../components/screen_icon_avatar.dart';
import '../../../modules/cart/components/deliver_address_screens/add_deliver_address_form.dart';
import '../../../modules/cart/components/deliver_address_screens/added_address_dialog.dart';
import '../../../modules/cart/components/deliver_address_screens/address_validator.dart';
import '../../../modules/cart/components/general/input_formatters.dart';
import '../../../modules/cart/components/general/large_button.dart';
import '../../../modules/cart/models/address.dart';
import '../../../modules/cart/store/action_creators.dart';
import '../../../modules/cart/utils.dart';
import '../../../store/state.dart';
import '../../../utils.dart' as GeneralUtils;

class AddDeliverAddressScreen extends StatelessWidget {
  final _streetController = TextEditingController();
  final _streetNumberController = TextEditingController();

  final _zipCodeController = TextEditingController();
  String get _zipCode {
    return CepInputFormatter().unmaskText(_zipCodeController.text);
  }

  final _complementController = TextEditingController();

  final Address address;
  bool get isUpdate => address != null;

  AddDeliverAddressScreen({Key key, this.address}) : super(key: key);

  void _confirm(BuildContext context) async {
    final validationMessage = _validate();
    if (validationMessage.isNotEmpty) {
      _showInvalidDataSnackBar(
        context,
        message: validationMessage,
      );
      return;
    }

    final address = Address(
      addressId: this.address?.addressId,
      street: _streetController.text,
      number: int.parse(_streetNumberController.text),
      zipcode: _zipCode,
      complement: _complementController.text.isEmpty
          ? null
          : _complementController.text,
      isDefault: this.address?.isDefault,
    );
    if (isUpdate) {
      await _updateAddress(address);
      GeneralUtils.Utils.showContentOnlyDialog(
        context: context,
        child: AddedDeliverAddressDialog(context, isUpdate: true).dialog,
      );
    } else {
      await _addAddress(address);
      GeneralUtils.Utils.showContentOnlyDialog(
        context: context,
        child: AddedDeliverAddressDialog(context).dialog,
      );
    }
  }

  String _validate() {
    final street = _streetController.text;
    final streetNumber = _streetNumberController.text;

    final validator = AddressValidator(street, streetNumber, _zipCode);
    validator.validate();

    return validator.validationMessage;
  }

  void _showInvalidDataSnackBar(BuildContext context, {String message}) {
    final scaffold = Scaffold.of(context);
    final backgroundColor = Theme.of(context).accentColor;
    final content = Text(
      message ?? 'Dados inválidos! Por favor tente novamente.',
    );

    GeneralUtils.Utils.showSnackBar(
      scaffold,
      content,
      backgroundColor: backgroundColor,
    );
  }

  Future<void> _addAddress(Address address) {
    return addDeliverAddress(address);
  }

  Future<void> _updateAddress(Address address) {
    return updateDeliverAddress(address);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomViewInset = mediaQuery.viewInsets.bottom;

    return Scaffold(
      appBar: MyAppBar(
        centerTitle: !isUpdate,
        title: '${isUpdate ? 'Atualizar' : 'Adicionar'} endereço',
        actions: isUpdate
            ? [
                TextButton(
                  child: Text('Remover'),
                  onPressed: () {},
                )
              ]
            : [],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 56),
            children: [
              ScreenIconAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                      '${Utils.imagesPath}deliver_address.svg'),
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
          Positioned(
            bottom: bottomViewInset == 0 ? 24 : 12,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: StoreConnector<AppState, bool>(
                converter: (store) => store.state.cartState.loadingAddresses,
                builder: (context, loadingAddresses) {
                  return LargeButton(
                    child: Text(loadingAddresses ? 'AGUARDE' : 'CONFIRMAR'),
                    elevation: 4,
                    onPressed:
                        loadingAddresses ? null : () => _confirm(context),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
