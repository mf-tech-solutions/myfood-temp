import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/outlined_input.dart';
import '../../../cart/components/general/input_formatters.dart';

class UserPersonalInfoForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController cpfController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  final cpfFormatter = CpfInputFormatter();
  final phoneFormatter = CellphoneInputFormatter();

  UserPersonalInfoForm({
    Key key,
    @required this.nameController,
    @required this.cpfController,
    @required this.phoneController,
    @required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          controller: phoneController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(15),
            phoneFormatter,
          ],
        ),
        SizedBox(height: 16),
        OutlinedInput(
          autoFillHints: [AutofillHints.email],
          labelText: 'E-mail',
          hintText: 'seu@email.com',
          inputType: TextInputType.emailAddress,
          controller: emailController,
        ),
      ],
    );
  }
}
