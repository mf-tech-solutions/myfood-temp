import 'package:MyFood/components/large_icon_avatar.dart';
import 'package:MyFood/constants.dart';
import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';

class PaymentMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: MyAppBar(title: 'Métodos de pagamento'),
      body: ListView(
        padding: EdgeInsets.fromLTRB(12, 24, 12, 24),
        children: [
          LargeIconAvatar(
            icon: Icons.account_balance_wallet_rounded,
          ),
          SizedBox(height: 24),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cartões',
                    style: textTheme.headline6,
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: theme.accentColor),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (_, index) => Card(
                  child: ListTile(
                    title: Text('Cartão ${index + 1}'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit_rounded),
                      onPressed: () {},
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => SizedBox(height: 12),
              ),
              Divider(height: 48),
              Card(
                child: ListTile(
                  title: Text('Dinheiro'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
