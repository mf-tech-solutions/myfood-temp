import 'package:flutter/material.dart';

import '../resource.dart';
import '../../../constants.dart';
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
                icon: Icon(Icons.cancel),
                label: Text(CartResource.cancel.toUpperCase()),
                textColor: Colors.black87,
                onPressed: onCloseHandler,
              ),
              RaisedButton.icon(
                color: Constants.accentColor,
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                label: Text(CartResource.confirm.toUpperCase()),
                textColor: Colors.white,
                elevation: 0,
                onPressed: onConfirmHandler,
              )
            ]);
}
