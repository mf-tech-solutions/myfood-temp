import 'package:MyFood/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/alert_dialog.dart';
import '../../../components/app_bar/app_bar.dart';
import '../../../components/screen_icon_avatar.dart';
import '../../../modules/cart/components/formatters.dart';
import '../../../modules/cart/components/payment_methods_screen/card_validator.dart';
import '../../../modules/cart/components/payment_methods_screen/user_card_form.dart';
import '../../../modules/cart/models/card.dart';
import '../../../modules/cart/resource.dart';
import '../../../modules/cart/store/action_creators.dart';
import '../../../utils.dart';

class AddUserCardScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _cardNumberController = TextEditingController();
  final _cardNumberFormatter = UserCardFormatter();

  final _cardCvvController = TextEditingController();
  final _cardDueDateController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  final _cardHolderSocialIdController = TextEditingController();
  final _cardHolderSocialIdFormatter = CpfFormatter();

  final UserCard card;
  bool get isUpdate => card != null;

  Widget get removeCardAction {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.cartState.loadingCards,
      builder: (context, loading) {
        return TextButton(
          child: Text('Remover'),
          onPressed: loading ? null : _removeCard,
        );
      },
    );
  }

  Widget _getOkButton(BuildContext context) {
    return TextButton(
      child: Text(CartResource.ok.toUpperCase()),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  AddUserCardScreen({Key key, this.card}) : super(key: key) {
    if (isUpdate) {
      _cardNumberController.text = _cardNumberFormatter.maskText(card.number);
      _cardCvvController.text = card.cvv.toString();
      _cardDueDateController.text = card.dueDate;
      _cardHolderNameController.text = card.cardHolderName;
      _cardHolderSocialIdController.text =
          _cardHolderSocialIdFormatter.maskText(
        card.cardHolderSocialId,
      );
    }
  }

  void _confirm(BuildContext context) async {
    String validationMessage = validate();
    if (validationMessage.isNotEmpty) {
      showInvalidDataSnackBar(context, message: validationMessage);
      return;
    }

    final unmaskedCardNumber =
        _cardNumberFormatter.unmaskText(_cardNumberController.text);
    final unmaskedCardHolderSocialId = _cardHolderSocialIdFormatter.unmaskText(
      _cardHolderSocialIdController.text,
    );
    final cardDto = UserCardDto(
      cardNumber: unmaskedCardNumber,
      cardHolderName: _cardHolderNameController.text,
      cardHolderSocialId: unmaskedCardHolderSocialId,
      dueDate: _cardDueDateController.text,
      cvv: int.parse(_cardCvvController.text),
    );

    if (isUpdate) {
      await updateUserCard(cardDto);
    } else {
      await addUserCard(cardDto);
    }

    Utils.showContentOnlyDialog(
      context: context,
      child: MyAlertDialog(
        title: Text(
          'Cartão ${isUpdate ? 'atualizado' : 'adicionado'} com sucesso',
        ),
        actions: [_getOkButton(context)],
      ),
    ).then((_) => Navigator.of(context).pop());
  }

  void _removeCard() {
    removeUserCard(card.id).then((_) async {
      final context = _scaffoldKey.currentContext;

      await Utils.showContentOnlyDialog(
        context: context,
        child: MyAlertDialog(
          title: Text('Cartão removido com sucesso'),
          actions: [_getOkButton(context)],
        ),
      );

      Navigator.of(context).pop();
    });
  }

  String validate() {
    final unmaskedCardNumber = _cardNumberFormatter.unmaskText(
      _cardNumberController.text,
    );
    final unmaskedSocialId = _cardHolderSocialIdFormatter.unmaskText(
      _cardHolderSocialIdController.text,
    );

    final validator = CardValidator(
      unmaskedCardNumber,
      _cardCvvController.text,
      _cardDueDateController.text,
      _cardHolderNameController.text,
      unmaskedSocialId,
    );
    validator.validate();
    return validator.validationMessage;
  }

  void showInvalidDataSnackBar(BuildContext context, {String message}) {
    final scaffold = _scaffoldKey.currentState;
    final backgroundColor = Theme.of(context).accentColor;
    final content = Text(
      message ?? 'Dados inválidos! Por favor tente novamente.',
    );

    Utils.showSnackBar(
      scaffold,
      content,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(
        centerTitle: !isUpdate,
        title: '${isUpdate ? 'Atualizar' : 'Adicionar'} cartão',
        actions: isUpdate ? [removeCardAction] : [],
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
          UserCardForm(
            cardNumberController: _cardNumberController,
            cardCvvController: _cardCvvController,
            cardDueDateController: _cardDueDateController,
            cardHolderNameController: _cardHolderNameController,
            cardHolderSocialIdController: _cardHolderSocialIdController,
            onConfirmCallback: _confirm,
          ),
        ],
      ),
    );
  }
}
