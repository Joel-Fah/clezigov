import 'dart:math';
import 'dart:ui';

import 'package:clezigov/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../utils/constants.dart';

void showNotificationSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor = infoColor,
  IconData? icon = infoIcon,
  Function()? onTap
}) {
  return showTopSnackBar(
    Overlay.of(context),
    dismissDirection: [
      DismissDirection.vertical,
      DismissDirection.horizontal,
    ],
    animationDuration: duration * 6,
    onTap: onTap ?? () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: AlertDialog(
              title: Text('Notification'),
              content: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              icon: Transform.rotate(
                angle: 5 * pi / 180,
                child: UnconstrainedBox(
                  child: Container(
                    padding: allPadding * 2,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius * 2,
                      color: backgroundColor?.withOpacity(0.1) ?? infoColor.withOpacity(0.1),
                    ),
                    child: Icon(
                      icon ?? infoIcon,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
              iconColor: backgroundColor ?? infoColor,
              actions: [
                PrimaryButton.label(
                  label: 'Close',
                  backgroundColor: seedColorPalette.shade50,
                  labelColor: seedColor,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          );
        },
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
