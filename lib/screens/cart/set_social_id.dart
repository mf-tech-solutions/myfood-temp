import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/alert_dialog.dart';
import '../../components/app_bar/app_bar.dart';
import '../../components/large_button.dart';
import '../../components/outlined_input.dart';
import '../../constants.dart';
import '../../modules/cart/components/formatters.dart';
import '../../modules/cart/resource.dart';
import '../../modules/cart/store/action_creators.dart';
import '../../modules/cart/store/selectors.dart';
import '../../store/state.dart';
import '../../utils.dart';

class SetSocialIdScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _socialIdController = TextEditingController();
  final _socialIdFormatter = CpfFormatter();

  String get unmaskedSocialId {
    return _socialIdFormatter.unmaskText(_socialIdController.text);
  }

  Widget get dialog {
    final context = _scaffoldKey.currentContext;
    var popCount = 0;

    return MyAlertDialog(
      title: Text('Alteração realizada.'),
      actions: [
        TextButton(
          child: Text('Voltar ao carrinho'),
          onPressed: () => Navigator.of(context).popUntil(
            (_) => popCount++ >= 2,
          ),
        ),
      ],
    );
  }

  SetSocialIdScreen({
    Key key,
    String socialId,
  }) : super(key: key) {
    _socialIdController.text = _socialIdFormatter.maskText(socialId);
  }

  void setIncludeSocialId(bool value) {
    if (!value) {
      _socialIdController.text = '';
    }
    setSocialIdInNote(
      value,
      unmaskedSocialId.isNotEmpty ? null : unmaskedSocialId,
    );
  }

  void _confirm() {
    final validationMessage = _validate();
    if (validationMessage.isNotEmpty) {
      Utils.showSnackBar(
        _scaffoldKey.currentState,
        Text(validationMessage),
      );
    }

    setSocialIdInNote(
      includeSocialIdInNote(),
      unmaskedSocialId,
    );

    Utils.showContentOnlyDialog(
      context: _scaffoldKey.currentContext,
      child: dialog,
    );
  }

  String _validate() {
    if (!includeSocialIdInNote()) {
      return '';
    } else if (unmaskedSocialId.isEmpty) {
      return 'Informe o CPF';
    } else if (unmaskedSocialId.length != 11) {
      return 'CPF deve conter 11 dígitos. (pontuação não inclusa)';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(title: 'CPF na nota'),
      body: StoreConnector<AppState, bool>(
        converter: (store) => store.state.cartState.includeSocialIdInNote,
        builder: (context, includeSocialId) {
          final socialIdInput = Padding(
            padding: EdgeInsets.only(top: 16, bottom: 24),
            child: OutlinedInput(
              controller: _socialIdController,
              hintText: _socialIdFormatter.maskText('00000000000'),
              labelText: 'CPF',
              inputFormatters: [
                _socialIdFormatter,
                LengthLimitingTextInputFormatter(14),
              ],
            ),
          );

          return ListView(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            physics: NeverScrollableScrollPhysics(),
            children: [
              SwitchListTile(
                title: Text('Incluir CPF na nota'),
                value: includeSocialId,
                onChanged: setIncludeSocialId,
              ),
              AnimatedCrossFade(
                firstChild: socialIdInput,
                firstCurve: Constants.animationCurve,
                secondChild: Container(height: 24),
                secondCurve: Constants.animationCurve,
                crossFadeState: includeSocialId
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Constants.widgetTransitionDuration,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LargeButton(
                    child: Text(CartResource.confirm.toUpperCase()),
                    onPressed: _confirm,
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
