import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../modules/auth/auth_resource.dart';
import '../../modules/auth/store/actions.dart';
import '../../modules/auth/components/user_avatar.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(userRoute),
          child: UserAvatar(),
        ),
        TextButton.icon(
          icon: Icon(Icons.exit_to_app_rounded),
          label: Text(AuthResource.signOut.toUpperCase()),
          onPressed: () {
            signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              loginRoute,
              (_) => false,
            );
          },
        ),
      ],
    );
  }
}
