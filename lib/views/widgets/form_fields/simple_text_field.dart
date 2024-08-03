import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../utils/constants.dart';

class SimpleTextFormField extends StatelessWidget {
  const SimpleTextFormField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: formFieldDecoration,
      child: TextFormField(
        controller: controller,
        style: AppTextStyles.body,
        keyboardType: keyboardType ?? TextInputType.text,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          constraints: BoxConstraints(
            minHeight: 48.0,
            maxHeight: 56.0,
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: AppInputBorders.border,
          focusedBorder: AppInputBorders.focusedBorder,
          errorBorder: AppInputBorders.errorBorder,
          focusedErrorBorder: AppInputBorders.focusedErrorBorder,
          enabledBorder: AppInputBorders.enabledBorder,
          disabledBorder: AppInputBorders.disabledBorder,
        ),
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
