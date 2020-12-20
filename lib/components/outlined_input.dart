import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnSubmitted = void Function(String);

class OutlinedInput extends TextField {
  OutlinedInput({
    Key key,
    List<String> autoFillHints,
    @required TextEditingController controller,
    TextCapitalization capitalization,
    bool enforcedMaxLength = false,
    String hintText,
    List<TextInputFormatter> inputFormatters,
    TextInputType inputType,
    TextInputAction keyBoardAction,
    String labelText,
    int maxLength,
    OnSubmitted onSubmitted,
  }) : super(
          autofillHints: autoFillHints,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
            labelText: labelText,
          ),
          inputFormatters: inputFormatters,
          key: key,
          keyboardType: inputType,
          maxLength: maxLength,
          maxLengthEnforced: enforcedMaxLength,
          textCapitalization: capitalization ?? TextCapitalization.none,
          textInputAction: keyBoardAction ?? TextInputAction.done,
          onSubmitted: onSubmitted,
        );
}
