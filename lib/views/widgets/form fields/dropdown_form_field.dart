import 'package:clezigov/utils/constants.dart';
import 'package:flutter/material.dart';

class DefaultDropdownFormField extends StatelessWidget {
  const DefaultDropdownFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    this.onChanged,
    this.validator, this.items,
  });

  final String hintText;
  final Icon prefixIcon, suffixIcon;
  final Function(Object?)? onChanged;
  final String? Function(Object?)? validator;
  final List<DropdownMenuItem<Object?>>? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: formFieldDecoration,
      child: DropdownButtonFormField<Object?>(
        isExpanded: true,
        borderRadius: borderRadius,
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
          border: OutlineInputBorder(
            borderRadius: borderRadius * 2,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius * 2,
            borderSide: BorderSide(
              color: seedColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius * 2,
            borderSide: BorderSide(
              color: dangerColor,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius * 2,
            borderSide: BorderSide(
              color: dangerColor,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius * 2,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: borderRadius * 2,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.5,
            ),
          ),
        ),
        items: items,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
