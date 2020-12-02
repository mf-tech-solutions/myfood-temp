import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/alert_dialog.dart';
import '../../../components/screen_icon_avatar.dart';
import '../../../components/app_bar/app_bar.dart';
import '../../../modules/cart/components/payment_methods_screen/user_card_input.dart';
import '../../../modules/cart/components/formatters.dart';
import '../../../modules/cart/models/card.dart';
import '../../../modules/cart/resource.dart';
import '../../../modules/cart/store/action_creators.dart';
import '../../../utils.dart';

class AddUserCardScreen extends StatelessWidget {
  final _cardNumberController = TextEditingController();
  final _cardNumberFormatter = UserCardFormatter();

  Widget getOkButton(BuildContext context) {
    return TextButton(
      child: Text(CartResource.ok.toUpperCase()),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  void _onConfirmCallback(BuildContext context) {
    final okButton = getOkButton(context);
    final actions = [okButton];

    if (!cardNumberIsValid()) {
      Utils.showContentOnlyDialog(
        context: context,
        child: MyAlertDialog(
          title: Text('Número inválido de cartão'),
          actions: actions,
        ),
      );
      return;
    }

    final unmaskedCardNumber =
        _cardNumberFormatter.unmaskText(_cardNumberController.text);

    addUserCard(
      UserCardDto(
        cardNumber: unmaskedCardNumber,
      ),
    ).then(
      (value) => Utils.showContentOnlyDialog(
        context: context,
        child: MyAlertDialog(
          title: Text('Cartão adicionado com sucesso'),
          actions: actions,
        ),
      ),
    );
  }

  bool cardNumberIsValid() {
    final unmaskedCardNumber =
        _cardNumberFormatter.unmaskText(_cardNumberController.text);
    return unmaskedCardNumber.length == 16;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Adicionar cartão',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          ScreenIconAvatar(
            child: Stack(
              children: [
                SvgPicture.asset('assets/images/add_user_card.svg'),
              ],
            ),
          ),
          SizedBox(height: 24),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  UserCardInput(controller: _cardNumberController),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                      elevation: 0,
                      child: Text(
                        CartResource.confirm.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _onConfirmCallback(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
