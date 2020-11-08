import 'dart:async';

import 'package:MyFood/components/async_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models/user.dart';
import '../../../store/state.dart';

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    return StoreConnector<AppState, User>(
      converter: (store) => store.state.authState.user,
      builder: (_, user) {
        if (user == null) return Container();

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                height: 56,
                width: 56,
                child: AsyncAvatar(
                  imageUrl: user.imgUrl,
                  backgroundColor: primaryColor,
                  child: Text(user.name.characters.elementAt(0)),
                ),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: textTheme.subtitle2,
                  ),
                  SizedBox(height: 4),
                  Text(
                    user.address,
                    style: textTheme.subtitle1.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
