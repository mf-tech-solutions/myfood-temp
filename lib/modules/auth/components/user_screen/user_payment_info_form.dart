import 'package:flutter/material.dart';

class UserPaymentInfoForm extends StatefulWidget {
  @override
  _UserPaymentInfoFormState createState() => _UserPaymentInfoFormState();
}

class _UserPaymentInfoFormState extends State<UserPaymentInfoForm> {
  bool useCpfOnNote = true;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              SizedBox(
                height: 32,
                width: 32,
                child: InkWell(
                  borderRadius: BorderRadius.circular(32),
                  onTap: () {},
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Incluir CPF na nota'),
              Switch(
                value: useCpfOnNote,
                onChanged: (_) => setState(() => useCpfOnNote = !useCpfOnNote),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
