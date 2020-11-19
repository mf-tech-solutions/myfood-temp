import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/screen_icon_avatar.dart';
import '../../components/app_bar/app_bar.dart';
import '../../modules/cart/components/payment_methods/payment_methods_list.dart';
import '../../routes.dart';

class PaymentMethodsScreen extends StatelessWidget {
  void goToAddUsercardScreen(BuildContext context) {
    Navigator.of(context).pushNamed(addUserCardRoute);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: MyAppBar(title: 'Métodos de pagamento'),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          ScreenIconAvatar(
            child: SvgPicture.asset('assets/images/payment_method.svg'),
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
                    onPressed: () => goToAddUsercardScreen(context),
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
