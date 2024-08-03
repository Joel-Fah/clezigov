import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton._({
    this.height = 48.0,
    this.label,
    this.child,
    this.backgroundColor = seedColor,
    this.onPressed,
    this.labelColor = scaffoldBgColor,
  })  : assert(label != null || child != null,
            'Either label or child must be provided.'),
        assert(label == null || child == null,
            'Only one of label or child can be provided.'),
        assert(labelColor != null || child == null,
            'Only one of labelColor or child can be provided.');

  // PrimaryButton with label
  PrimaryButton.label({
    double? height = 48.0,
    required String label,
    Color? labelColor,
    Color? backgroundColor,
    void Function()? onPressed,
  }) : this._(
          height: height,
          label: label,
          labelColor: labelColor,
          backgroundColor: backgroundColor ?? seedColor,
          onPressed: onPressed,
        );

  // PrimaryButton with child
  PrimaryButton.child({
    double? height = 48.0,
    required Widget child,
    Color? backgroundColor,
    Color? sideColor,
    void Function()? onPressed,
  }) : this._(
          height: height,
          child: child,
          backgroundColor: backgroundColor ?? seedColor,
          onPressed: onPressed,
        );

  final double? height;
  final String? label;
  final Widget? child;
  final Color? backgroundColor, labelColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaWidth(context),
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButtonTheme.of(context).style?.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor;
            }
            return backgroundColor ?? seedColor;
          }),
          side: WidgetStateProperty.resolveWith<BorderSide?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return BorderSide(color: disabledColor);
              }
              return BorderSide(color: backgroundColor ?? seedColor);
            },
          ),
        ),
        child: child ??
            Text(
              label!,
              style: AppTextStyles.body.copyWith(
                color: labelColor ?? scaffoldBgColor,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
