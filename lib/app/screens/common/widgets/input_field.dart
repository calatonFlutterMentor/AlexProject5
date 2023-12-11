import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final Function(String value) onValueChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyBoardType;
  final InputDecoration? inputDecoration;
  final TextAlign textAlign;

  const InputField({
    super.key,
    required this.hintText,
    required this.onValueChanged,
    required this.keyBoardType,
    this.validator,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.inputDecoration = const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        fillColor: Colors.grey,
        filled: true,
        hintText: "",
        hintStyle: TextStyle(color: Colors.grey)),
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onValueChanged(String value) {
    widget.onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign,
      keyboardType: widget.keyBoardType,
      controller: controller,
      validator: widget.validator,
      onChanged: (value) {
        _onValueChanged(value);
      },
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
