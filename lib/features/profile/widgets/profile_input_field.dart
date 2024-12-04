import 'package:flutter/material.dart';

class ProfileInputField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const ProfileInputField({
    Key? key,
    required this.label,
    this.initialValue,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
