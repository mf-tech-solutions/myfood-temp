import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../components/outlined_input.dart';

class AddAddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Text(
            'Novo endereço',
            style: textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: OutlinedInput(
            labelText: 'Rua',
            controller: TextEditingController(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(40),
            ],
          ),
        ),
        OutlinedInput(
          labelText: 'Número',
          controller: TextEditingController(),
          maxLength: 10,
          inputType: TextInputType.number,
        ),
        OutlinedInput(
          labelText: 'CEP',
          controller: TextEditingController(),
        ),
        OutlinedInput(
          labelText: 'Complemento',
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
