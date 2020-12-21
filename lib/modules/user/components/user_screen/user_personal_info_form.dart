import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/outlined_input.dart';
import '../../../user/components/general/input_formatters.dart';

class UserPersonalInfoForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController socialIdController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  final cpfFormatter = CpfInputFormatter();
  final phoneFormatter = CellphoneInputFormatter();

  UserPersonalInfoForm({
    Key key,
    @required this.nameController,
    @required this.socialIdController,
    @required this.phoneController,
    @required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedInput(
          autoFillHints: [AutofillHints.name],
          controller: nameController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(60),
          ],
          keyBoardAction: TextInputAction.next,
          labelText: 'Nome',
        ),
        SizedBox(height: 16),
        OutlinedInput(
          controller: socialIdController,
          hintText: cpfFormatter.maskText('00000000000'),
          inputFormatters: [
            LengthLimitingTextInputFormatter(14),
            cpfFormatter,
          ],
          inputType: TextInputType.number,
          keyBoardAction: TextInputAction.next,
          labelText: 'CPF',
        ),
        SizedBox(height: 16),
        OutlinedInput(
          autoFillHints: [AutofillHints.telephoneNumber],
          controller: phoneController,
          hintText: phoneFormatter.maskText('0090000000'),
          inputFormatters: [
            LengthLimitingTextInputFormatter(15),
            phoneFormatter,
          ],
          inputType: TextInputType.number,
          keyBoardAction: TextInputAction.next,
          labelText: 'Telefone',
        ),
        SizedBox(height: 16),
        OutlinedInput(
          autoFillHints: [AutofillHints.email],
          controller: emailController,
          labelText: 'E-mail',
          hintText: 'seu@email.com',
          inputType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
