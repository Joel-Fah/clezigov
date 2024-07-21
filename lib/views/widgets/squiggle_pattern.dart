import 'package:flutter/material.dart';
import 'package:wavy_slider/wavy_slider.dart';

import '../../utils/constants.dart';

class SquigglePattern extends StatelessWidget {
  const SquigglePattern({
    super.key,
    this.onChanged,
    this.activeColor = disabledColor,
    this.backgroundColor = disabledColor,
    this.value = 1.0,
  });

  final Function(double value)? onChanged;
  final Color? activeColor, backgroundColor;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return WavySlider(
      onChanged: onChanged ?? (value) {},
      color: activeColor ?? disabledColor,
      backgroundColor: backgroundColor ?? disabledColor,
      strokeWidth: 1.5,
      value: value ?? 1.0,
      waveWidth: 8.0,
      waveHeight: 4.0,
    );
  }
}