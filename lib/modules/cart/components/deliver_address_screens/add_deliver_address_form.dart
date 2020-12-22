import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/outlined_input.dart';
import '../../models/address.dart';
import '../general/input_formatters.dart';

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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
