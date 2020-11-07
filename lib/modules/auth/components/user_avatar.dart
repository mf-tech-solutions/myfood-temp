import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models/user.dart';
import '../../../store/state.dart';

class UserAvatar extends StatefulWidget {
  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  bool fetchedImage = false;

  void listenToImageChange(NetworkImage image) {
    final imgStream = image.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener(
      (info, __) => updateState(() => fetchedImage = true),
    );
    imgStream.addListener(listener);
  }

  void updateState(Function updateFunction) {
    void run() {
      scheduleMicrotask(
        () {
          setState(updateFunction);
        },
      );
    }

    run();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return StoreConnector<AppState, User>(
      converter: (store) => store.state.authState.user,
      builder: (_, user) {
        if (user == null) return Container();

        final image = NetworkImage(user.imgUrl);
        listenToImageChange(image);

        return Row(
          children: [
            SizedBox(
              height: 56,
              width: 56,
              child: CircleAvatar(
                backgroundImage: fetchedImage ? image : null,
                child: fetchedImage
                    ? null
                    : Text(
                        user.name.substring(0, 1),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
        );
      },
    );
  }
}
