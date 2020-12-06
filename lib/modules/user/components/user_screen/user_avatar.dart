import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../../../components/async_avatar.dart';

class UserAvatar extends StatelessWidget {
  final User user;

  Widget get userNameInitial {
    return Text('${user.name.characters.elementAt(0)}');
  }

  Widget getImageEditButton(Color primaryColor) {
    final double size = 32;
    final borderRadius = BorderRadius.circular(size);

    return SizedBox(
      height: size,
      width: size,
      child: Material(
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {},
          child: Icon(
            Icons.edit,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  const UserAvatar({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 96,
      child: AsyncAvatar(
        image: NetworkImage(user.imageUrl),
        backgroundColor: Colors.white10,
        child: userNameInitial,
      ),
    );
  }
}
