import 'dart:async';

import 'package:flutter/material.dart';

class AsyncAvatar extends StatefulWidget {
  final String imageUrl;
  final Widget child;
  final Color backgroundColor;

  const AsyncAvatar({
    Key key,
    @required this.imageUrl,
    @required this.backgroundColor,
    @required this.child,
  }) : super(key: key);

  @override
  _AsyncAvatarState createState() => _AsyncAvatarState();
}

class _AsyncAvatarState extends State<AsyncAvatar> {
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
    final image = NetworkImage(widget.imageUrl);
    listenToImageChange(image);

    return CircleAvatar(
      backgroundImage: fetchedImage ? image : null,
      backgroundColor: widget.backgroundColor,
      child: fetchedImage ? null : widget.child,
    );
  }
}
