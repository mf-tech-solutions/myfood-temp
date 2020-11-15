import 'package:MyFood/components/alert_dialog.dart';
import 'package:MyFood/constants.dart';
import 'package:flutter/material.dart';
import '../resource.dart';

class ProductAddedToCartDialog extends MyAlertDialog {
  ProductAddedToCartDialog({
    Key key,
    bool isUpdate = false,
    @required List<Widget> actions,
  }) : super(
          key: key,
          title: Text(
            isUpdate ? CartResource.productUpdated : CartResource.productAdded,
          ),
          actions: actions,
        );
}
