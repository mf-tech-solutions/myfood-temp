import 'package:flutter/material.dart';

import '../../../../components/alert_dialog.dart';

class AddedDeliverAddressDialog {
  final BuildContext context;
  final bool isUpdate;

  Widget get dialog {
    return MyAlertDialog(
      content: Text(
          'Endereço ${isUpdate ? 'atualizado' : 'adicionado'} com sucesso!'),
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

  AddedDeliverAddressDialog(this.context, {this.isUpdate = false});

  void _onOkButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onBackToAddressListButtonPressed(BuildContext context) {
    var count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2); //pops twice
  }
}
