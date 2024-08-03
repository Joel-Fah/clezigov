import 'dart:ui';

import 'package:clezigov/views/widgets/buttons/primary_button.dart';
import 'package:clezigov/views/widgets/tilt_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../utils/constants.dart';
import 'alert_dialog.dart';

void showNotificationSnackBar(
    {required BuildContext context,
    required String message,
    Color? backgroundColor = seedColor,
    IconData? icon = LucideIcons.badgeInfo,
    Function()? onTap}) {
  return showTopSnackBar(
    Overlay.of(context),
    dismissDirection: [
      DismissDirection.vertical,
      DismissDirection.horizontal,
    ],
    animationDuration: duration * 6,
    onTap: onTap ??
        () {
          showDefaultDialog(
            context: context,
            message: message,
            backgroundColor: backgroundColor,
            title: 'Notification',
            icon: icon,
            actions: [
              PrimaryButton.label(
                label: 'Close',
                backgroundColor: seedColorPalette.shade50,
                labelColor: seedColor,
                onPressed: () => context.pop(),
              ),
            ],
          );
        },
    CustomSnackBar.info(
      message: message,
      backgroundColor: backgroundColor ?? infoColor,
      textAlign: TextAlign.left,
      borderRadius: borderRadius * 2,
      iconPositionLeft: 260,
      iconRotationAngle: -15,
      iconPositionTop: 0,
      icon: Icon(
        icon ?? infoIcon,
        size: 120.0,
        color: darkColor.withOpacity(0.1),
      ),
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: scaffoldBgColor,
      ),
    ),
  );
}
