import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../utils/constants.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Recommended",
              style: AppTextStyles.h3,
            ),
          ),
          Swiper(
            layout: SwiperLayout.CUSTOM,
            customLayoutOption:
                CustomLayoutOption(startIndex: -1, stateCount: 3)
                  ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                  ..addTranslate([
                    Offset(-370.0, -40.0),
                    Offset(0.0, 0.0),
                    Offset(370.0, -40.0),
                  ]),
            physics: const BouncingScrollPhysics(),
            itemWidth: mediaWidth(context) - 70,
            itemHeight: 180,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: borderRadius * 2.75,
                      boxShadow: [shadow]),
                  child: Text(
                    "Procedure ${index + 1}",
                    style: AppTextStyles.h4.copyWith(
                      fontFamily: nohemiFont,
                    ),
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
