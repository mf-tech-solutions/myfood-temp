import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../general/input_formatters.dart';
import '../../../../components/outlined_input.dart';

class UserPersonalInfoForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController cpfController;
  final TextEditingController cellphoneController;
  final TextEditingController zipcodeController;
  final TextEditingController streetController;
  final TextEditingController streetNumberController;
  final TextEditingController complementController;

  final cpfFormatter = CpfInputFormatter();
  final cellphoneFormatter = CellphoneInputFormatter();
  final zipCodeFormmater = CepInputFormatter();

  UserPersonalInfoForm({
    Key key,
    @required this.nameController,
    @required this.cpfController,
    @required this.cellphoneController,
    @required this.zipcodeController,
    @required this.streetController,
    @required this.streetNumberController,
    @required this.complementController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dados Pessoais',
            style: textTheme.headline6,
          ),
          SizedBox(height: 24),
          OutlinedInput(
            labelText: 'Nome',
            controller: nameController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(60),
            ],
          ),
          SizedBox(height: 16),
          OutlinedInput(
            labelText: 'CPF',
            inputType: TextInputType.number,
            hintText: '000.000.000-00',
            controller: cpfController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(14),
              cpfFormatter,
            ],
          ),
          SizedBox(height: 16),
          OutlinedInput(
            labelText: 'Telefone',
            hintText: '(00) 90000-0000',
            inputType: TextInputType.number,
            controller: cellphoneController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(15),
              cellphoneFormatter,
            ],
          ),
          SizedBox(height: 16),
          OutlinedInput(
            labelText: 'CEP',
            hintText: '00.000-000',
            inputType: TextInputType.number,
            controller: zipcodeController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              zipCodeFormmater,
            ],
          ),
          SizedBox(height: 16),
          OutlinedInput(
            labelText: 'Rua',
            controller: streetController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(100),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: OutlinedInput(
                  labelText: 'Número',
                  inputType: TextInputType.number,
                  controller: streetNumberController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                ),
                flex: 2,
              ),
              SizedBox(width: 12),
              Expanded(
                child: OutlinedInput(
                  labelText: 'Complemento',
                  controller: complementController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                ),
                flex: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
