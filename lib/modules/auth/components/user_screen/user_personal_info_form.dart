import 'package:MyFood/components/outlined_input.dart';
import 'package:flutter/material.dart';

class UserPersonalInfoForm extends StatelessWidget {
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
          SizedBox(height: 24),
          OutlinedInput(
            labelText: 'Nome',
          ),
          SizedBox(height: 16),
          OutlinedInput(
            labelText: 'Telefone',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          OutlinedInput(
            labelText: 'CEP',
          ),
          SizedBox(height: 16),
          OutlinedInput(
            labelText: 'Rua',
          ),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: OutlinedInput(
                  labelText: 'Número',
                  keyboardType: TextInputType.number,
                ),
                flex: 2,
              ),
              SizedBox(width: 16),
              Expanded(
                child: OutlinedInput(
                  labelText: 'Complemento',
                ),
                flex: 5,
              ),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
