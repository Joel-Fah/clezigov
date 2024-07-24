import 'dart:math';

import 'package:clezigov/views/widgets/form_fields/dropdown_form_field.dart';
import 'package:clezigov/views/widgets/home_feeds/procedures_feed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../utils/constants.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    String? monthSelected;

    final List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius * 2.75,
              boxShadow: [shadow],
            ),
            constraints: BoxConstraints(maxHeight: 144),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              alignment: Alignment.centerRight,
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contributing since",
                        style: AppTextStyles.small,
                      ),
                      Text(
                        "12 Feb\n2024",
                        style: AppTextStyles.title.copyWith(
                          fontFamily: nohemiFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(4 months ago)",
                        style: AppTextStyles.small.copyWith(
                          color: disabledColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: -48,
                  bottom: -72,
                  child: Transform.rotate(
                    angle: 10 * pi / 180,
                    child: Icon(
                      LucideIcons.badgeCheck,
                      color: seedColor.withOpacity(0.5),
                      size: 192,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Gap(16.0),
        ListHeader(title: "Annual activity"),
        Gap(16.0),
        Row(
          children: [
            Expanded(
                child: ListHeader(title: "Statistics for\nthe month of...")),
            // Gap(8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: DefaultDropdownFormField(
                  hintText: "Month",
                  prefixIcon: Icon(LucideIcons.calendar),
                  items: months,
                  searchController: searchController,
                  searchTitle: "Select month",
                  onChanged: (value) {
                    monthSelected = value;
                  },
                ),
              ),
            ),
          ],
        ),
        Gap(16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius * 2.75,
                      color: Colors.white,
                      boxShadow: [shadow],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Requests this month",
                              style: AppTextStyles.small,
                            ),
                            Text(
                              "(${monthSelected ?? "N/A"})",
                              style: AppTextStyles.body
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "12",
                          style: AppTextStyles.title.copyWith(
                            fontSize: 64.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: nohemiFont,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      LucideIcons.arrowUpRight,
                      size: 16.0,
                    ),
                  )
                ],
              ),
              Gap(16.0),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 24.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius * 2.75,
                            color: Color(0xFFDFEDE5),
                            // boxShadow: [shadow],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3",
                                style: AppTextStyles.title.copyWith(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: nohemiFont,
                                  color: successColor,
                                ),
                              ),
                              Gap(16.0),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.checkCircle2,
                                    color: successColor,
                                  ),
                                  Gap(8.0),
                                  Text(
                                    "Accepted",
                                    style: AppTextStyles.body.copyWith(
                                      color: successColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            LucideIcons.arrowUpRight,
                            size: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap(8.0),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 24.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius * 2.75,
                            color: Color(0xFFF4E4E1),
                            // boxShadow: [shadow],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "5",
                                style: AppTextStyles.title.copyWith(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: nohemiFont,
                                  color: dangerColor,
                                ),
                              ),
                              Gap(16.0),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.xCircle,
                                    color: dangerColor,
                                  ),
                                  Gap(8.0),
                                  Text(
                                    "Declined",
                                    style: AppTextStyles.body.copyWith(
                                      color: dangerColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            LucideIcons.arrowUpRight,
                            size: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Gap(8.0),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius * 2.75,
                      color: disabledColor.withOpacity(0.1),
                      // boxShadow: [shadow],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "4",
                          style: AppTextStyles.title.copyWith(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: nohemiFont,
                            color: disabledColor,
                          ),
                        ),
                        Gap(16.0),
                        Row(
                          children: [
                            Icon(
                              LucideIcons.circleDashed,
                              color: disabledColor,
                            ),
                            Gap(8.0),
                            Text(
                              "Pending",
                              style: AppTextStyles.body.copyWith(
                                color: disabledColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      LucideIcons.arrowUpRight,
                      size: 16.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
