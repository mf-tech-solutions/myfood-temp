import 'package:flutter/material.dart';

import '../../../components/async_avatar.dart';
import '../../../routes.dart';
import '../store/selectors.dart';

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;
    final user = getUser();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.transparent,
      child: Row(
        children: [
          GestureDetector(
            child: SizedBox(
              height: 56,
              width: 56,
              child: AsyncAvatar(
                image: NetworkImage(user.imageUrl),
                backgroundColor: primaryColor,
                child: Text(user.name.characters.elementAt(0)),
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(userImageRoute),
          ),
          SizedBox(width: 8),
          Text(
            user.name,
            style: textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
