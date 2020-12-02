import 'package:flutter/material.dart';

import 'drawer_header.dart';
import 'primary_item.dart';
import '../../routes.dart';
import '../../modules/food/resource.dart';

class AppDrawer extends StatelessWidget {
  void _goTo(String route, BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          AppDrawerHeader(),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: PrimaryItem(
                  text: FoodResource.recipesTitle,
                  icon: Icons.menu_book_rounded,
                  onTapHandler: () => _goTo(recipesRoute, context),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: PrimaryItem(
                  text: FoodResource.gamesTitle,
                  icon: Icons.videogame_asset_rounded,
                  onTapHandler: () => _goTo(gamesRoute, context),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          ListTile(
            title: Text('Métodos de pagamento'),
            trailing: Icon(Icons.chevron_right_rounded),
            onTap: () => _goTo(paymentMethodsRoute, context),
          ),
          ListTile(
            title: Text('Endereços'),
            trailing: Icon(Icons.chevron_right_rounded),
            onTap: () => _goTo(deliverAddressListRoute, context),
          ),
          ListTile(
            title: Text('Endereços'),
            trailing: Icon(Icons.chevron_right_rounded),
            onTap: () => _goTo(orderListRoute, context),
          ),
        ],
      ),
    );
  }
}
