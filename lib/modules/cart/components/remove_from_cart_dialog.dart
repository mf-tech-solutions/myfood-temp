import 'package:flutter/material.dart';

import '../resource.dart';
import '../../../components/alert_dialog.dart';

class RemoveFromCartDialog extends MyAlertDialog {
  final Function onConfirmHandler;
  final Function onCloseHandler;

  RemoveFromCartDialog({
    Key key,
    @required this.onConfirmHandler,
    @required this.onCloseHandler,
  }) : super(
          key: key,
          title: Text(CartResource.removeItemTitle),
          content: Text(CartResource.removeItemMessage),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.close),
              label: Text(CartResource.cancel.toUpperCase()),
              textColor: Colors.black87,
              onPressed: onCloseHandler,
            ),
            FlatButton.icon(
              icon: Icon(Icons.check),
              label: Text(CartResource.confirm.toUpperCase()),
              onPressed: onConfirmHandler,
            )
          ],
        );
}
