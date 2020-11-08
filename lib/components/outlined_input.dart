import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedInput extends TextField {
  OutlinedInput({
    Key key,
    String labelText,
    TextInputType keyboardType,
    int maxLength,
    List<TextInputFormatter> inputFormatters,
  }) : super(
          key: key,
          keyboardType: keyboardType,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            labelText: labelText,
          ),
        );
}
