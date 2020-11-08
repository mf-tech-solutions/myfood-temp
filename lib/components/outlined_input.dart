import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedInput extends TextField {
  OutlinedInput({
    Key key,
    String labelText,
    String hintText,
    TextInputType inputType,
    int maxLength,
    TextEditingController controller,
    List<TextInputFormatter> inputFormatters,
  }) : super(
          key: key,
          keyboardType: inputType,
          maxLength: maxLength,
          controller: controller,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
}
