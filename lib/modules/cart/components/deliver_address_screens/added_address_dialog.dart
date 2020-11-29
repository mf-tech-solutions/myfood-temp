import 'package:flutter/material.dart';

import '../../../../components/alert_dialog.dart';

class AddedDeliverAddressDialog {
  final BuildContext context;

  Widget get dialog {
    return MyAlertDialog(
      content: Text('Endereço adicionado com sucesso!'),
      actions: [
        TextButton(
          child: Text('OK', style: TextStyle(color: Colors.black87)),
          onPressed: () => _onOkButtonPressed(context),
        ),
        TextButton(
          child: Text('VER ENDEREÇOS'),
          onPressed: () => _onBackToAddressListButtonPressed(context),
        ),
      ],
    );
  }

  AddedDeliverAddressDialog(this.context);

  void _onOkButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onBackToAddressListButtonPressed(BuildContext context) {
    var count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2); //pops twice
  }
}
