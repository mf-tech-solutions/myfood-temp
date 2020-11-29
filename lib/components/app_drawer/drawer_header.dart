import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../modules/user/resource.dart';
import '../../modules/user/store/actions.dart';
import '../../modules/user/components/user_avatar.dart';

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
          label: Text(UserResource.signOut.toUpperCase()),
          onPressed: () async {
            await signOut();
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
