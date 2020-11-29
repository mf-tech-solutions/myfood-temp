import 'package:flutter/material.dart';

import '../resource.dart';
import '../../navigation/store/actionCreators.dart';
import '../../../routes.dart';
import '../../../constants.dart';
import '../../../components/alert_dialog.dart';

class ProductAddedToCartDialog {
  final BuildContext context;
  final bool isUpdate;

  Widget get dialog {
    final title = Text(
      isUpdate ? CartResource.productUpdated : CartResource.productAdded,
    );

    final okButton = TextButton.icon(
      icon: Icon(
        Icons.check_rounded,
        color: Constants.blackTextColor,
      ),
      label: Text(
        CartResource.ok,
        style: TextStyle(color: Constants.blackTextColor),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    final goToCartButton = TextButton.icon(
      icon: Icon(Icons.shopping_cart_rounded),
      label: Text(CartResource.goToCartScreen),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          homeRoute,
          (route) => false,
        );
        setCurrentIndex(1);
      },
    );

    return MyAlertDialog(
      title: title,
      actions: [okButton, goToCartButton],
    );
  }

  ProductAddedToCartDialog({
    Key key,
    this.isUpdate = false,
    @required this.context,
  });
}
