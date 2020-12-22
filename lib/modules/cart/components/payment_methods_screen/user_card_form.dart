import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/outlined_input.dart';
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

  UserCardForm({
    Key key,
    @required this.cardNumberController,
    @required this.cardCvvController,
    @required this.cardDueDateController,
    @required this.cardHolderNameController,
    @required this.cardHolderSocialIdController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
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
      ],
    );
  }
}
