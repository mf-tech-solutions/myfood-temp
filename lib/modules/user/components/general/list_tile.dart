import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final _defaultPadding = const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 0,
  );

  final String title;
  final String subtitle;
  final Widget leading;
  final Widget trailing;
  final EdgeInsets contentPadding;
  final Function onTap;

  MyListTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.contentPadding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding ?? _defaultPadding,
      title: Padding(
        padding: EdgeInsets.only(bottom: this.subtitle != null ? 4 : 0),
        child: Text(title),
      ),
      subtitle: subtitle == null ? null : Text(subtitle),
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
