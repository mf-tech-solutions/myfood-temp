import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../components/outlined_input.dart';
import '../../../../store/state.dart';
import '../../../../utils.dart';
import '../../models/address.dart';
import '../../store/action_creators.dart';
import '../general/input_formatters.dart';
import '../general/large_button.dart';
import 'added_address_dialog.dart';
import 'address_validator.dart';

class AddDeliverAddressForm extends StatelessWidget {
  final TextEditingController streetController;
  final TextEditingController streetNumberController;
  final TextEditingController complementController;

  final TextEditingController zipCodeController;
  final zipCodeFormatter = CepInputFormatter();
  String get zipCode => zipCodeFormatter.unmaskText(zipCodeController.text);

  final Address address;
  bool get isUpdate => address != null;

  AddDeliverAddressForm({
    Key key,
    @required this.streetController,
    @required this.streetNumberController,
    @required this.zipCodeController,
    @required this.complementController,
    this.address,
  }) : super(key: key) {
    if (!isUpdate) {
      return;
    }

    streetController.text = address.street;
    streetNumberController.text = address.number.toString();
    zipCodeController.text = zipCodeFormatter.maskText(address.zipcode);
    complementController.text = address.complement;
  }

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
      street: streetController.text,
      number: int.parse(streetNumberController.text),
      zipcode: zipCode,
      complement:
          complementController.text.isEmpty ? null : complementController.text,
      isDefault: this.address?.isDefault,
    );
    if (isUpdate) {
      await _updateAddress(address);
      Utils.showContentOnlyDialog(
        context: context,
        child: AddedDeliverAddressDialog(context, isUpdate: true).dialog,
      );
    } else {
      await _addAddress(address);
      Utils.showContentOnlyDialog(
        context: context,
        child: AddedDeliverAddressDialog(context).dialog,
      );
    }
  }

  String _validate() {
    final street = streetController.text;
    final streetNumber = streetNumberController.text;

    final validator = AddressValidator(street, streetNumber, zipCode);
    validator.validate();

    return validator.validationMessage;
  }

  void _showInvalidDataSnackBar(BuildContext context, {String message}) {
    final scaffold = Scaffold.of(context);
    final backgroundColor = Theme.of(context).accentColor;
    final content = Text(
      message ?? 'Dados inválidos! Por favor tente novamente.',
    );

    Utils.showSnackBar(
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
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: OutlinedInput(
                  capitalization: TextCapitalization.words,
                  controller: streetController,
                  enforcedMaxLength: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  keyBoardAction: TextInputAction.next,
                  labelText: 'Rua',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: OutlinedInput(
                  controller: streetNumberController,
                  inputType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyBoardAction: TextInputAction.next,
                  labelText: 'Número',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: OutlinedInput(
                  controller: zipCodeController,
                  inputType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    zipCodeFormatter,
                  ],
                  keyBoardAction: TextInputAction.next,
                  labelText: 'CEP',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 7,
                child: OutlinedInput(
                  capitalization: TextCapitalization.words,
                  controller: complementController,
                  enforcedMaxLength: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  labelText: 'Complemento',
                  onSubmitted: (_) => _confirm(context),
                ),
              ),
            ],
          ),
        ),
        StoreConnector<AppState, bool>(
          converter: (store) => store.state.cartState.loadingAddresses,
          builder: (context, loadingAddresses) {
            return SizedBox(
              width: double.infinity,
              child: LargeButton(
                child: Text(loadingAddresses ? 'AGUARDE' : 'CONFIRMAR'),
                onPressed: loadingAddresses ? null : () => _confirm(context),
              ),
            );
          },
        ),
      ],
    );
  }
}
