import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TiltIcon extends StatelessWidget {
  const TiltIcon({
    super.key,
    this.backgroundColor,
    this.icon,
    this.angle = 5,
  });

  final double? angle;
  final Color? backgroundColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -(angle ?? 5.0) * pi / 180,
      child: UnconstrainedBox(
        child: Container(
          padding: allPadding * 2,
          decoration: BoxDecoration(
            borderRadius: borderRadius * 2,
            color:
            backgroundColor?.withOpacity(0.1) ?? seedColor.withOpacity(0.1),
          ),
          child: Icon(
            icon ?? infoIcon,
            color: backgroundColor ?? seedColor,
            size: 32.0,
          ),
        ),
      ),
    );
  }
}
