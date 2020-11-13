import 'dart:async';

import 'package:flutter/material.dart';

import '../resource.dart';
import '../../../constants.dart';
import '../../../components/large_icon_avatar.dart';

class SearchNoMatch extends StatefulWidget {
  final Color textColor;

  const SearchNoMatch({Key key, this.textColor}) : super(key: key);

  @override
  _SearchNoMatchState createState() => _SearchNoMatchState();
}

class _SearchNoMatchState extends State<SearchNoMatch> {
  TextStyle get _textStyle {
    return TextStyle(
      color: widget.textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LargeIconAvatar(icon: Icons.search_off_rounded),
        SizedBox(height: 8),
        Text(
          FoodResource.searchNoMatchWarning,
          style: _textStyle,
        ),
      ],
    );
  }
}
