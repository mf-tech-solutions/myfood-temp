import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'added_address_dialog.dart';
import 'address_validator.dart';
import '../general/input_formatters.dart';
import '../general/large_button.dart';
import '../../models/address.dart';
import '../../store/action_creators.dart';
import '../../../../utils.dart';
import '../../../../components/outlined_input.dart';

class AddDeliverAddressForm extends StatelessWidget {
  final TextEditingController streetController;
  final TextEditingController streetNumberController;
  final TextEditingController complementController;

  final TextEditingController zipCodeController;
  final zipCodeFormatter = CepInputFormatter();
  String get zipCode => zipCodeFormatter.unmaskText(zipCodeController.text);

  AddDeliverAddressForm({
    Key key,
    @required this.streetController,
    @required this.streetNumberController,
    @required this.zipCodeController,
    @required this.complementController,
  }) : super(key: key);

  void showInvalidDataSnackBar(BuildContext context, {String message}) {
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

  void confirm(BuildContext context) async {
    final validationMessage = validate();
    if (validationMessage.isNotEmpty) {
      showInvalidDataSnackBar(
        context,
        message: validationMessage,
      );
      return;
    }

    final address = Address(
      street: streetController.text,
      number: int.parse(streetNumberController.text),
      zipcode: zipCode,
      complement: complementController.text,
    );

    await addDeliverAddress(address);
    Utils.showContentOnlyDialog(
      context: context,
      child: AddedDeliverAddressDialog(context).dialog,
    );
  }

  String validate() {
    final street = streetController.text;
    final streetNumber = streetNumberController.text;

    final validator = AddressValidator(street, streetNumber, zipCode);
    validator.validate();
    return validator.validationMessage;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
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
                flex: 4,
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
                flex: 6,
                child: OutlinedInput(
                  capitalization: TextCapitalization.words,
                  controller: complementController,
                  enforcedMaxLength: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  labelText: 'Complemento',
                  onSubmitted: (_) => confirm(context),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: LargeButton(
            child: Text('CONFIRMAR'),
            onPressed: () => confirm(context),
          ),
        ),
      ],
    );
  }
}
