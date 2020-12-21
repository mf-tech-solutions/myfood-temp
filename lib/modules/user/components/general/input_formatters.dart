import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfInputFormatter extends MaskTextInputFormatter {
  CpfInputFormatter({
    String initialText,
  }) : super(mask: '###.###.###-##');
}

class CellphoneInputFormatter extends MaskTextInputFormatter {
  CellphoneInputFormatter({
    String initialText,
  }) : super(mask: '(##) #####-####');
}

class CepInputFormatter extends MaskTextInputFormatter {
  CepInputFormatter({
    String initialText,
  }) : super(mask: '##.###-###');
}
