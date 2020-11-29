import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final _defaultPadding = const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 0,
  );

  final Widget title;
  final Widget subtitle;
  final Widget leading;
  final Widget trailing;
  final EdgeInsets contentPadding;
  final Function onTap;

  const MyListTile({
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
        padding: const EdgeInsets.only(bottom: 8),
        child: title,
      ),
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
