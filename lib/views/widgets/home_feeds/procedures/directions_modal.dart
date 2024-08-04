import 'package:clezigov/views/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/constants.dart';
import '../../tilt_icon.dart';

void showDirectionsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    builder: (context) {
      return Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            children: [
              TiltIcon(
                icon: HugeIcons.strokeRoundedRoute02,
              ),
              Gap(8.0),
              Text(
                "Navigate to an office offering\nthis service around me ",
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              Gap(8.0),
              Text(
                "We found 2 places around your area where you can complete this procedure.",
                style: AppTextStyles.body,
              ),
              Gap(16.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: seedColorPalette.shade50,
                      borderRadius: borderRadius * 2.75,
                    ),
                  ),
                  Animate(
                    effects: [
                      FadeEffect(),
                      MoveEffect(
                        duration: duration * 0.25,
                        begin: Offset(0.0, 0.0),
                        end: Offset(0.0, -10),
                      ),
                      ShimmerEffect(
                        duration: duration * 0.25,
                      )
                    ],
                    onPlay: (controller) => controller.repeat(
                      reverse: true,
                      period: duration * 3,
                    ),
                    child: Positioned(
                      bottom: -70.0,
                      child: Icon(
                        HugeIcons.strokeRoundedLocationShare02,
                        size: 250,
                        color: seedColor.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
              Gap(20.0),
              PrimaryButton.label(
                onPressed: () {},
                label: "Open interactive map",
              )
            ],
          ),
          Positioned(
            top: -10.0,
            right: 10.0,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                HugeIcons.strokeRoundedCancel01,
              ),
            ),
          ),
        ],
      );
    },
  );
}
