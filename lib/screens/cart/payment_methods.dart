import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../modules/cart/components/payment_methods/payment_methods_list.dart';
import '../../components/large_icon_avatar.dart';
import '../../components/app_bar/app_bar.dart';

class PaymentMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: MyAppBar(title: 'Métodos de pagamento'),
      body: ListView(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 24),
        children: [
          LargeIconAvatar(
            child: SvgPicture.asset('assets/images/payment_method.svg'),
            backgroundColor: Colors.transparent,
            size: 8 * 30.0,
          ),
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
              PaymentMethodsList(),
            ],
          ),
        ],
      ),
    );
  }
}
