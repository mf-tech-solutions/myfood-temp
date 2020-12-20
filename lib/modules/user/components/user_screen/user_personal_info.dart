import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../general/input_formatters.dart';

class UserPersonalInfo extends StatelessWidget {
  final User user;

  final _cpfFormatter = CpfInputFormatter();
  final _phoneFormatter = CellphoneInputFormatter();

  final fieldLabelTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.black54,
  );

  UserPersonalInfo({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome', style: textTheme.caption),
            SizedBox(height: 4),
            Text(
              user.name,
              style: textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CPF',
              style: fieldLabelTextStyle,
            ),
            SizedBox(height: 4),
            Text(
              _cpfFormatter.maskText(user.cpf),
              style: textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Telefone',
              style: fieldLabelTextStyle,
            ),
            SizedBox(height: 4),
            Text(
              _phoneFormatter.maskText(user.phone),
              style: textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'E-mail',
              style: fieldLabelTextStyle,
            ),
            SizedBox(height: 4),
            Text(
              user.email,
              style: textTheme.subtitle1,
            ),
          ],
        ),
      ],
    );
  }
}
