import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../models/procedures/procedures.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/utility_functions.dart';

class RecommendedProcedure extends StatelessWidget {
  const RecommendedProcedure({
    super.key,
    required this.procedure,
  });

  final Procedure procedure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: allPadding * 1.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius * 2.75,
          boxShadow: [shadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: seedColorPalette.shade50,
                    borderRadius: borderRadius * 2,
                  ),
                  child: Text(
                    procedure.category.name,
                    style: AppTextStyles.small.copyWith(
                      color: seedColor,
                    ),
                  ),
                ),
                Text(
                  procedure.status.name == "active" ? "" : "deprecated",
                  style: AppTextStyles.small.copyWith(
                    color: procedure.status.name == "active"
                        ? Colors.transparent
                        : dangerColor,
                  ),
                )
              ],
            ),
            Gap(8.0),
            Expanded(
              child: Text(
                procedure.title,
                style: AppTextStyles.h3,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Gap(8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              LucideIcons.coins,
                              color: disabledColor,
                              size: 16.0,
                            ),
                            Gap(4.0),
                            Expanded(
                              child: Text(
                                "${addThousandSeparator(procedure.price.toInt().toString())} F",
                                style: AppTextStyles.small.copyWith(
                                  fontSize: 14.0,
                                  color: disabledColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(16.0),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              LucideIcons.timer,
                              color: disabledColor,
                              size: 16.0,
                            ),
                            Gap(4.0),
                            Expanded(
                              child: Text(
                                "~${convertToReadableTime(procedure.estimatedTimeToComplete)}",
                                style: AppTextStyles.small.copyWith(
                                  fontSize: 14.0,
                                  color: disabledColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(16.0),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              LucideIcons.fileText,
                              color: disabledColor,
                              size: 16.0,
                            ),
                            Gap(4.0),
                            Text(
                              "x${procedure.documents.length}",
                              style: AppTextStyles.small.copyWith(
                                fontSize: 14.0,
                                color: disabledColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: warningColor.withOpacity(0.16),
                    borderRadius: borderRadius * 1.75,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.bookmark,
                        color: warningColor,
                        size: 16.0,
                      ),
                      Gap(4.0),
                      Text(
                        "46",
                        style: AppTextStyles.body.copyWith(
                          color: warningColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
