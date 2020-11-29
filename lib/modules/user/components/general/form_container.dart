import 'package:flutter/material.dart';

import '../../../../constants.dart';

class FormContainer extends StatefulWidget {
  final Widget child;
  final double width;

  FormContainer({
    @required this.child,
    @required this.width,
  });

  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tween = Tween<Offset>(begin: Offset(0, 120), end: Offset.zero);
    return Hero(
      tag: this,
      child: TweenAnimationBuilder<Offset>(
        tween: tween,
        duration: Constants.widgetTransitionDuration,
        builder: (context, offset, child) {
          return Transform.translate(
            offset: offset,
            child: child,
          );
        },
        child: Container(
          width: widget.width,
          padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
