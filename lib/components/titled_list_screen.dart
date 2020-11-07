import 'package:flutter/material.dart';
import 'list_wrapper.dart';

class TitledListScreen extends StatelessWidget {
  final String title;
  final Widget list;

  const TitledListScreen({
    Key key,
    @required this.title,
    @required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(
          height: 96,
          child: Center(
            child: Text(
              title,
              style: textTheme.headline5.copyWith(color: Colors.white),
            ),
          ),
        ),
        ListWrapper(child: list),
      ],
    );
  }
}
