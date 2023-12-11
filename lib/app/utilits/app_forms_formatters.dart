import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class AppFormsFormatters {
  static final MaskTextInputFormatter phoneMask = MaskTextInputFormatter(
      mask: '+38##########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
