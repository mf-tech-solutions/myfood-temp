import 'package:flutter/material.dart';

import '../formatters.dart';
import '../../../auth/models/user.dart';

class UserSocialSecutiryView extends StatelessWidget {
  final _formatter = CpfFormatter();
  final User user;

  UserSocialSecutiryView({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CPF na nota'),
        SizedBox(height: 4),
        Text(
          _formatter.maskText(user.cpf),
          style: textTheme.subtitle1.copyWith(
            color: theme.disabledColor,
          ),
        ),
      ],
    );
  }
}
