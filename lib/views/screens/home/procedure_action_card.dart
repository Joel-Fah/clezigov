import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants.dart';

class ProcedureActionCard extends StatelessWidget {
  const ProcedureActionCard({
    super.key,
    this.onTap,
    this.backgroundColor,
    required this.icon,
    required this.title,
  });

  final Function()? onTap;
  final Color? backgroundColor;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: borderRadius * 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius * 2,
        highlightColor: backgroundColor?.withOpacity(0.2) ??
            scaffoldBgColor.withOpacity(0.2),
        overlayColor: WidgetStateProperty.all<Color>(
          backgroundColor?.withOpacity(0.2) ?? scaffoldBgColor.withOpacity(0.2),
        ),
        child: BackdropFilter(
          filter: blurFilter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            decoration: BoxDecoration(
              borderRadius: borderRadius * 2,
              color: backgroundColor ?? scaffoldBgColor.withOpacity(0.16),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: scaffoldBgColor,
                ),
                Gap(8.0),
                Text(
                  title,
                  style: AppTextStyles.small.copyWith(
                    color: scaffoldBgColor,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
