import 'package:flutter/material.dart';

import '../../modules/user/components/user_avatar.dart';
import '../../routes.dart';

class AppDrawerHeader extends StatelessWidget {
  void goToUserScreen(BuildContext context) {
    Navigator.of(context).pushNamed(userRoute);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: UserAvatar(),
      trailing: IconButton(
        icon: Icon(Icons.chevron_right_rounded),
        onPressed: () => goToUserScreen(context),
        padding: EdgeInsets.zero,
      ),
      onTap: () => goToUserScreen(context),
    );
  }
}
