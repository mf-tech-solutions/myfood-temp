import 'package:flutter/material.dart';

class AsyncAvatar extends StatefulWidget {
  final NetworkImage image;
  final Widget child;
  final Color backgroundColor;

  AsyncAvatar({
    Key key,
    @required this.image,
    @required this.backgroundColor,
    @required this.child,
  }) : super(key: key);

  @override
  _AsyncAvatarState createState() => _AsyncAvatarState();
}

class _AsyncAvatarState extends State<AsyncAvatar> {
  bool _mountedImage = false;

  @override
  void initState() {
    super.initState();

    widget.image.resolve(new ImageConfiguration()).addListener(
      new ImageStreamListener((_, mounted) {
        if (mounted) {
          setState(() {
            _mountedImage = true;
          });
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _mountedImage
        ? CircleAvatar(
            backgroundImage: widget.image,
          )
        : CircleAvatar(
            backgroundColor: widget.backgroundColor,
            child: widget.child,
          );
  }
}
