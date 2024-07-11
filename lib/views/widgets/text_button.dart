import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class TertiaryButton extends StatelessWidget {
  TertiaryButton._({
    this.height = 48.0,
    this.label,
    this.child,
    this.onPressed,
  })  : assert(label != null || child != null,
  'Either label or child must be provided.'),
        assert(label == null || child == null,
        'Only one of label or child can be provided.');

  // PrimaryButton with label
  TertiaryButton.label({
    double? height,
    required String label,
    Color? sideColor,
    void Function()? onPressed,
  }) : this._(
    height: height,
    label: label,
    onPressed: onPressed,
  );

  // PrimaryButton with child
  TertiaryButton.child({
    double? height,
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
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        child: child ??
            Text(
              label!,
              style: TextStyle(
                fontSize: 16.0,
                color: seedColor,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
