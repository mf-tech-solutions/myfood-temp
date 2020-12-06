import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  final String message;

  const EmptyListMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          message,
          style: textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Arraste para baixo para recarregar a tela',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
