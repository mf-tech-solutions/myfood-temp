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
              Text('Método de pagamento'),
              Icon(Icons.chevron_right),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CPF na nota',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text('000.000.000-00'),
                ],
              ),
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
