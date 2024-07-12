import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton._({
    this.height = 48.0,
    this.label,
    this.child,
    this.onPressed,
    this.sideColor,
  })  : assert(label != null || child != null,
  'Either label or child must be provided.'),
        assert(label == null || child == null,
        'Only one of label or child can be provided.');

  // PrimaryButton with label
  SecondaryButton.label({
    double? height = 48.0,
    required String label,
    Color? sideColor,
    void Function()? onPressed,
  }) : this._(
    height: height,
    label: label,
    sideColor: sideColor ?? seedColor,
    onPressed: onPressed,
  );

  // PrimaryButton with child
  SecondaryButton.child({
    double? height = 48.0,
    required Widget child,
    Color? sideColor,
    void Function()? onPressed,
  }) : this._(
    height: height,
    child: child,
    sideColor: sideColor ?? seedColor,
    onPressed: onPressed,
  );

  final double? height;
  final String? label;
  final Widget? child;
  final Color? sideColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaWidth(context),
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButtonTheme.of(context).style?.copyWith(
          side: WidgetStateProperty.all<BorderSide>(
            BorderSide(
              color: sideColor ?? seedColor,
            ),
          ),
          overlayColor: WidgetStateProperty.all<Color>(
            sideColor?.withOpacity(0.1) ?? seedColorPalette.shade50,
          ),
        ),
        child: child ??
            Text(
              label!,
              style: TextStyle(
                fontSize: 16.0,
                color: sideColor ?? seedColor,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
