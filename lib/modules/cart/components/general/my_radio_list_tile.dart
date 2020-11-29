import 'package:flutter/material.dart';

typedef OnChanged<T> = void Function(T);

class MyRadioListTile<T> extends StatelessWidget {
  /// [groupValue] Represents the current selected value of the group
  final T groupValue;

  /// [value] Represents the value that this item has.
  final T value;
  final String title;
  final String subtitle;
  final Widget secondary;
  final OnChanged<T> onChanged;

  const MyRadioListTile({
    Key key,
    @required this.groupValue,
    @required this.value,
    @required this.title,
    this.subtitle,
    this.secondary,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      groupValue: groupValue,
      secondary: secondary,
      subtitle: subtitle != null ? Text(subtitle) : null,
      title: Padding(
        padding: EdgeInsets.only(bottom: this.subtitle != null ? 8 : 0),
        child: Text(title),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
