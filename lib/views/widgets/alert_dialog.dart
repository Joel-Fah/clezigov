import 'package:clezigov/views/widgets/tilt_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../utils/constants.dart';

Future<dynamic> showDefaultDialog({
  required BuildContext context,
  required String title, message,
  Color? backgroundColor,
  IconData? icon = infoIcon,
  required List<Widget> actions,
  Widget? content, iconWidget,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return OrientationBuilder(
        builder: (context, orientation) {
          bool isLandscape = orientation == Orientation.landscape;

          return BackdropFilter(
            filter: blurFilter,
            child: Animate(
              effects: [FadeEffect(), MoveEffect()],
              child: AlertDialog(
                insetPadding: isLandscape
                    ? EdgeInsets.symmetric(vertical: 24.0, horizontal: 100.0)
                    : Theme.of(context).dialogTheme.insetPadding,
                icon: iconWidget ?? TiltIcon(
                  icon: icon,
                  backgroundColor: backgroundColor ?? seedColor,
                ),
                title: Text(title),
                titleTextStyle: AppTextStyles.h2.copyWith(color: darkColor),
                content: content ?? Text(
                  message,
                  style: AppTextStyles.body.copyWith(color: darkColor),
                ),
                iconColor: backgroundColor ?? seedColor,
                contentTextStyle: AppTextStyles.body.copyWith(color: darkColor),
                actions: actions,
                actionsOverflowButtonSpacing: 8.0,
              ),
            ),
          );
        }
      );
    },
  );
}
