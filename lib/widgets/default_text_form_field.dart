import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  const DefaultTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppTheme.gray,
            fontWeight: FontWeight.w400,
          )),
      validator: validator,
    );
  }
}
