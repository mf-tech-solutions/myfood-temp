import 'package:MyFood/modules/cart/components/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/outlined_input.dart';

class UserCardInput extends StatelessWidget {
  final _inputFormatter = UserCardFormatter();
  final TextEditingController controller;

  UserCardInput({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedInput(
      hintText: 'Número do cartão',
      controller: controller,
      inputFormatters: [
        _inputFormatter,
        LengthLimitingTextInputFormatter(20),
      ],
    );
  }
}
