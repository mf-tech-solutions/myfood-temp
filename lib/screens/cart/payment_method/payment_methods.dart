import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../components/screen_icon_avatar.dart';
import '../../../modules/cart/components/general/with_refresh_indicator.dart';
import '../../../modules/cart/components/payment_methods_screen/payment_methods_list.dart';
import '../../../modules/cart/models/card.dart';
import '../../../modules/cart/store/action_creators.dart';
import '../../../routes.dart';

class PaymentMethodsScreen extends StatelessWidget {
  void goToAddUserCardScreen(BuildContext context, {UserCard card}) {
    Navigator.of(context).pushNamed(addUserCardRoute, arguments: card);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final body = ListView(
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
            Text(
              'Cartões',
              style: textTheme.headline6,
            ),
            SizedBox(height: 16),
            PaymentMethodsList(),
          ],
        ),
      ],
    );
    return Scaffold(
      appBar: MyAppBar(title: 'Métodos de pagamento'),
      body: WithRefreshIndicator(child: body, onRefresh: getUserCards),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        heroTag: 'paymentMethodFab',
        onPressed: () => goToAddUserCardScreen(context),
      ),
    );
  }
}
