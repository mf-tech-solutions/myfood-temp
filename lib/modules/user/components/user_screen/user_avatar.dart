import 'package:flutter/material.dart';

import '../../../../components/async_avatar.dart';
import '../../../../routes.dart';
import '../../store/selectors.dart';
import '../general/user_initials.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  const UserAvatar({
    Key key,
    this.size = 96,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = getUser();

    return GestureDetector(
      child: SizedBox(
        height: size,
        width: size,
        child: Hero(
          tag: 'user_img',
          child: AsyncAvatar(
            image: NetworkImage(user.imageUrl),
            backgroundColor: Theme.of(context).primaryColor,
            child: UserInitials(color: Colors.white),
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(userImageRoute),
    );
  }
}
