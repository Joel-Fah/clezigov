import 'package:clezigov/views/widgets/primary_button.dart';
import 'package:clezigov/views/widgets/tilt_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
      return BackdropFilter(
        filter: blurFilter,
        child: AlertDialog(
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
      );
    },
  );
}
