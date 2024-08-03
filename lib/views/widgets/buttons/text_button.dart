import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class TertiaryButton extends StatelessWidget {
  TertiaryButton._({
    this.height = 48.0,
    this.label,
    this.child,
    this.onPressed, this.labelColor,
  })  : assert(label != null || child != null,
  'Either label or child must be provided.'),
        assert(label == null || child == null,
        'Only one of label or child can be provided.'),
        assert(labelColor == null || child == null,
        'Only one of labelColor or child can be provided.');

  // PrimaryButton with label
  TertiaryButton.label({
    double? height = 48.0,
    required String label,
    Color? labelColor,
    void Function()? onPressed,
  }) : this._(
    height: height,
    label: label,
    labelColor: labelColor,
    onPressed: onPressed,
  );

  // PrimaryButton with child
  TertiaryButton.child({
    double? height = 48.0,
    required Widget child,
    Color? sideColor,
    void Function()? onPressed,
  }) : this._(
    height: height,
    child: child,
    onPressed: onPressed,
  );

  final double? height;
  final String? label;
  final Widget? child;
  final Color? labelColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaWidth(context),
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButtonTheme.of(context).style?.copyWith(
          overlayColor: WidgetStateProperty.all<Color>(
            labelColor?.withOpacity(0.1) ?? seedColorPalette.shade50,
          ),
        ),
        child: child ??
            Text(
              label!,
              style: AppTextStyles.body.copyWith(
                color: labelColor ?? seedColor,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
