import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  final double width;

  FormContainer({
    @required this.child,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
