import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../input_formatters.dart';

class UserPersonalInfo extends StatelessWidget {
  final User user;

  final _cpfFormatter = CpfInputFormatter();
  final _phoneFormatter = CellphoneInputFormatter();
  final _zipcodeFormatter = CepInputFormatter();

  UserPersonalInfo({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dados Pessoais',
            style: textTheme.headline6,
          ),
          SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome',
                style: textTheme.subtitle2,
              ),
              SizedBox(height: 4),
              Text(
                user.name,
                style: textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CPF',
                style: textTheme.subtitle2,
              ),
              SizedBox(height: 4),
              Text(
                _cpfFormatter.maskText(user.cpf),
                style: textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Telefone',
                style: textTheme.subtitle2,
              ),
              SizedBox(height: 4),
              Text(
                _phoneFormatter.maskText(user.phone),
                style: textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CEP',
                style: textTheme.subtitle2,
              ),
              SizedBox(height: 4),
              Text(
                _zipcodeFormatter.maskText(user.address.zipcode),
                style: textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rua',
                style: textTheme.subtitle2,
              ),
              SizedBox(height: 4),
              Text(
                'Rua Sem Nome',
                style: textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Número',
                      style: textTheme.subtitle2,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '0',
                      style: textTheme.subtitle1,
                    ),
                  ],
                ),
                flex: 2,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Complemento',
                      style: textTheme.subtitle2,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '-',
                      style: textTheme.subtitle1,
                    ),
                  ],
                ),
                flex: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
