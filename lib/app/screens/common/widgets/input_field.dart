import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final String errorMassage;
  final Function(String value) onValueChanged;

  const InputField(
      {super.key,
        required this.hintText,
        required this.errorMassage,
        required this.onValueChanged});

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
      controller: controller,
      validator: (value) {
        if (value!= null && value.length < 4) {
          return widget.errorMassage;
        } else {
          return null;
        }
      },
      onChanged: (value) {
        _onValueChanged(value);
      },
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
