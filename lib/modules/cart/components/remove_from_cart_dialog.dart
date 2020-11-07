import 'package:flutter/material.dart';

import '../resource.dart';

class RemoveFromCartDialog extends StatelessWidget {
  final Function onConfirmHandler;

  const RemoveFromCartDialog({
    Key key,
    @required this.onConfirmHandler,
  }) : super(key: key);

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  void confirm(BuildContext context) {
    onConfirmHandler();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;

    return AlertDialog(
      title: Text(CartResource.removeItemTitle),
      content: Text(CartResource.removeItemMessage),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      actions: [
        FlatButton.icon(
          icon: Icon(Icons.cancel),
          label: Text(CartResource.cancel.toUpperCase()),
          textColor: Colors.black87,
          onPressed: () => close(context),
        ),
        RaisedButton.icon(
          color: accentColor,
          icon: Icon(Icons.check_circle),
          label: Text(CartResource.confirm.toUpperCase()),
          textColor: Colors.black87,
          elevation: 0,
          onPressed: () => confirm(context),
        ),
      ],
    );
  }
}
