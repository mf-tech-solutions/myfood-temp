import 'package:flutter/material.dart';

typedef ValidationCallback = String Function(String value);

class MyTextField extends StatefulWidget {
  final TextEditingController controller;

  final IconData icon;
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;

  final double height;
  final double widthFactor;

  MyTextField({
    @required this.controller,
    @required this.icon,
    @required this.isObscure,
    this.hintText,
    this.keyboardType,
    this.height = 56,
    this.widthFactor,
    Key key,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obscured = true;

  Widget get toggleVisibilityIcon {
    if (!this.widget.isObscure) return null;

    return GestureDetector(
      onTap: () {
        setState(() => obscured = !obscured);
      },
      child: Icon(
        obscured ? Icons.visibility : Icons.visibility_off,
        color: Theme.of(this.context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.primaryColorLight,
        borderRadius: BorderRadius.circular(this.widget.height),
      ),
      height: this.widget.height,
      width: size.width * (this.widget.widthFactor ?? 1),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: TextField(
        keyboardType: this.widget.keyboardType,
        controller: this.widget.controller,
        cursorColor: Colors.black87,
        obscureText: this.widget.isObscure && obscured,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: this.widget.hintText,
          prefixIcon: Icon(
            this.widget.icon,
            color: theme.primaryColor,
          ),
          suffixIcon: toggleVisibilityIcon,
        ),
      ),
    );
  }
}
