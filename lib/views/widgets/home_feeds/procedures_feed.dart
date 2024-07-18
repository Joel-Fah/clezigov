import 'package:card_swiper/card_swiper.dart';
import 'package:clezigov/models/procedures/category.dart';
import 'package:clezigov/views/widgets/home_feeds/procedures/recommended.dart';
import 'package:clezigov/views/widgets/tilt_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../models/procedures/procedures.dart';
import '../../../utils/constants.dart';
import '../../../utils/utility_functions.dart';

class ProceduresFeed extends StatelessWidget {
  const ProceduresFeed({
    super.key,
  });

  static const String routeName = '/procedures';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(children: [
            TextSpan(text: "Hey "),
            TextSpan(
              text: "Joël Fah",
              style: AppTextStyles.h2.copyWith(
                color: seedColor,
              ),
            ),
            TextSpan(text: ",\nStart the day relaxed"),
          ]),
          style: AppTextStyles.h2.copyWith(
            fontFamily: nohemiFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: seedColorPalette.shade50,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              splashColor: seedColorPalette.shade100,
              highlightColor: seedColorPalette.shade100,
              padding: allPadding * 2,
              icon: Icon(
                LucideIcons.search,
                color: seedColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListHeader(
            title: "Recommended",
          ),
          Swiper(
            layout: SwiperLayout.CUSTOM,
            customLayoutOption:
                CustomLayoutOption(startIndex: -1, stateCount: 3)
                  ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                  ..addTranslate([
                    Offset(-368.0, -40.0),
                    Offset(0.0, 0.0),
                    Offset(368.0, -40.0),
                  ]),
            physics: const BouncingScrollPhysics(),
            duration: (duration.inMilliseconds * 2).toInt(),
            curve: Curves.decelerate,
            itemWidth: mediaWidth(context) - 70,
            itemHeight: 180,
            itemCount: procedures.length,
            itemBuilder: (context, index) {
              final Procedure procedure = procedures[index];
              return RecommendedProcedure(procedure: procedure);
            },
          ),
          Gap(16.0),
          ListHeader(
            title: "Latest Updates",
          ),
          Gap(16.0),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: procedures.length,
            separatorBuilder: (context, index) => Divider(height: 0,),
            itemBuilder: (context, index) {
              final Procedure procedure = procedures[index];

              return InkWell(
                onTap: () {},
                overlayColor: WidgetStateProperty.all(Color(0xFFEBEAE9)),
                highlightColor: Color(0xFFEBEAE9),
                child: Padding(
                  padding: allPadding * 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getMonthAndYear(procedure.lastUpdatedAt),
                        style: AppTextStyles.small.copyWith(
                          color: disabledColor,
                        ),
                      ),
                      Text(procedure.title, style: AppTextStyles.h4),
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
                          Row(
                            children: [
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
                              ),
                              // Gap(8.0),
                              IconButton(onPressed: (){}, icon: Icon(LucideIcons.share2, size: 16.0,))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: AppTextStyles.h3,
      ),
    );
  }
}
