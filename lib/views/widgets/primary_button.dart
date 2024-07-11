import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton._({
    this.height = 48.0,
    this.label,
    this.child,
    this.backgroundColor = seedColor,
    this.onPressed,
    this.sideColor,
  })  : assert(label != null || child != null,
            'Either label or child must be provided.'),
        assert(label == null || child == null,
            'Only one of label or child can be provided.');

  // PrimaryButton with label
  PrimaryButton.label({
    double? height,
    required String label,
    Color? backgroundColor,
    void Function()? onPressed,
  }) : this._(
          height: height,
          label: label,
          backgroundColor: backgroundColor ?? seedColor,
          sideColor: backgroundColor ?? seedColor,
          onPressed: onPressed,
        );

  // PrimaryButton with child
  PrimaryButton.child({
    double? height,
    required Widget child,
    Color? backgroundColor,
    Color? sideColor,
    void Function()? onPressed,
  }) : this._(
          height: height,
          child: child,
          backgroundColor: backgroundColor ?? seedColor,
          sideColor: backgroundColor ?? seedColor,
          onPressed: onPressed,
        );

  final double? height;
  final String? label;
  final Widget? child;
  final Color? backgroundColor, sideColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButtonTheme.of(context).style?.copyWith(
              backgroundColor: WidgetStateProperty.all<Color>(backgroundColor!),
              side: WidgetStateProperty.all<BorderSide>(
                BorderSide(
                  color: sideColor ?? backgroundColor!,
                ),
              ),
            ),
        child: child ??
            Text(
              label!,
              style: const TextStyle(
                fontSize: 16.0,
                color: scaffoldBgColor,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
