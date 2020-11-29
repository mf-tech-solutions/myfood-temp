import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../general/large_button.dart';
import '../../../../utils.dart';
import '../../../../components/outlined_input.dart';

class AddUserAddressForm extends StatelessWidget {
  final TextEditingController streetController;
  final TextEditingController streetNumberController;
  final TextEditingController zipCodeController;
  final TextEditingController complementController;

  const AddUserAddressForm({
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

  void confirm(BuildContext context) {
    validate(context);
  }

  void validate(BuildContext context) {
    final street = streetController.text;
    final streetNumber = streetNumberController.text;
    final zipCode = zipCodeController.text;

    if (street.isEmpty) {
      final message = 'Informe a rua.';
      showInvalidDataSnackBar(context, message: message);
    } else if (streetNumber.isEmpty) {
      final message = 'Informe o número.';
      showInvalidDataSnackBar(context, message: message);
    } else if (zipCode.isEmpty) {
      final message = 'Informe o CEP.';
      showInvalidDataSnackBar(context, message: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: OutlinedInput(
            labelText: 'Rua',
            controller: streetController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(40),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: OutlinedInput(
            labelText: 'Número',
            controller: streetNumberController,
            maxLength: 10,
            inputType: TextInputType.number,
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
                  labelText: 'CEP',
                  controller: zipCodeController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 6,
                child: OutlinedInput(
                  labelText: 'Complemento',
                  controller: complementController,
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
