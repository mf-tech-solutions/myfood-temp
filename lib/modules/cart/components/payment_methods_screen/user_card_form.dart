import 'package:MyFood/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../components/large_button.dart';
import '../../../../components/outlined_input.dart';
import '../../resource.dart';
import '../formatters.dart';

class UserCardForm extends StatelessWidget {
  final cardNumberController;
  final cardNumberFormatter = UserCardFormatter();

  final cardCvvController;

  final cardDueDateController;
  final cardDueDateFormatter = UserCardDueDateFormatter();

  final cardHolderNameController;

  final cardHolderSocialIdController;
  final cardHolderSocialIdFormatter = CpfFormatter();

  final Function(BuildContext) onConfirmCallback;

  UserCardForm({
    Key key,
    @required this.cardNumberController,
    @required this.cardCvvController,
    @required this.cardDueDateController,
    @required this.cardHolderNameController,
    @required this.cardHolderSocialIdController,
    @required this.onConfirmCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedInput(
                  controller: cardNumberController,
                  hintText: cardNumberFormatter.maskText('0000000000000000'),
                  inputFormatters: [
                    cardNumberFormatter,
                    LengthLimitingTextInputFormatter(20),
                  ],
                  inputType: TextInputType.number,
                  keyBoardAction: TextInputAction.next,
                  labelText: 'Número do cartão',
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedInput(
                        controller: cardCvvController,
                        hintText: '000',
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
                        inputType: TextInputType.number,
                        keyBoardAction: TextInputAction.next,
                        labelText: 'CVV',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: OutlinedInput(
                        controller: cardDueDateController,
                        hintText: 'mm/aa',
                        inputFormatters: [
                          cardDueDateFormatter,
                          LengthLimitingTextInputFormatter(5),
                        ],
                        inputType: TextInputType.number,
                        keyBoardAction: TextInputAction.next,
                        labelText: 'Data de vencimento',
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12),
                OutlinedInput(
                  capitalization: TextCapitalization.characters,
                  controller: cardHolderNameController,
                  hintText: 'NOME NO CARTÃO',
                  keyBoardAction: TextInputAction.next,
                  labelText: 'Titular',
                ),
                SizedBox(height: 12),
                OutlinedInput(
                  controller: cardHolderSocialIdController,
                  hintText: cardHolderSocialIdFormatter.maskText('00000000000'),
                  inputType: TextInputType.number,
                  keyBoardAction: TextInputAction.done,
                  labelText: 'CPF do titular',
                  inputFormatters: [
                    cardHolderSocialIdFormatter,
                    LengthLimitingTextInputFormatter(16)
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24),

        // Confirm button
        StoreConnector<AppState, bool>(
          converter: (store) => store.state.cartState.loadingCards,
          builder: (context, loading) {
            final text = loading
                ? CartResource.confirming.toUpperCase()
                : CartResource.confirm.toUpperCase();
            final buttonChild = loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        text,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                : Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LargeButton(
                  child: buttonChild,
                  onPressed: loading ? null : () => onConfirmCallback(context),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
