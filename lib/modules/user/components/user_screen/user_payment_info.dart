import 'package:flutter/material.dart';

class UserPaymentInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informações de pagamento',
            style: textTheme.headline6,
          ),
          SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Método de pagamento',
                style: textTheme.subtitle2,
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.credit_card_rounded),
                  SizedBox(width: 4),
                  Text('Cartão'),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('CPF Incluso na nota'),
        ],
      ),
    );
  }
}
