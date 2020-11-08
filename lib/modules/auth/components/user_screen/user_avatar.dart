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
    final borderRadius = BorderRadius.circular(32);

    return InkWell(
      borderRadius: borderRadius,
      onTap: () {},
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
        ),
        child: Center(
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
    final primaryColor = Theme.of(context).primaryColor;

    return Stack(
      children: [
        SizedBox(
          height: 96,
          width: 96,
          child: AsyncAvatar(
            imageUrl: user.imgUrl,
            backgroundColor: Colors.white10,
            child: userNameInitial,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: getImageEditButton(primaryColor),
        ),
      ],
    );
  }
}
