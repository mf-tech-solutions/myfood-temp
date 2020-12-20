import 'package:flutter/material.dart';

import '../../../../components/async_avatar.dart';
import '../../../../routes.dart';
import '../../models/user.dart';
import '../../store/selectors.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  const UserAvatar({
    Key key,
    this.size = 96,
  }) : super(key: key);

  Widget buildUserNameInitial(User user) {
    return Text('${user.name.characters.elementAt(0)}');
  }

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    final userNameInitial = buildUserNameInitial(user);

    return GestureDetector(
      child: SizedBox(
        height: size,
        width: size,
        child: Hero(
          tag: 'user_img',
          child: AsyncAvatar(
            image: NetworkImage(user.imageUrl),
            backgroundColor: Colors.white10,
            child: userNameInitial,
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(userImageRoute),
    );
  }
}
