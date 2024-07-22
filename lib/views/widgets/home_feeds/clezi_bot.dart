import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:wavy_slider/wavy_slider.dart';

import '../../../utils/constants.dart';
import '../squiggle_pattern.dart';

class CleziBot extends StatelessWidget {
  const CleziBot({
    super.key,
  });

  static const String routeName = '/clezi';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text.rich(
            TextSpan(children: [
              TextSpan(text: "Hi I'm "),
              TextSpan(
                text: "Clezi",
                style: AppTextStyles.h2.copyWith(
                  color: seedColor,
                ),
              ),
              TextSpan(text: "\nHow can I help you?"),
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
          padding: EdgeInsets.only(top: 16.0),
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset(cleziChat),
            ),
            Gap(8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Your discussion with Clezi is still empty. You can ask anything about your procedures and he will assist with the required information.",
                style: AppTextStyles.body.copyWith(
                  color: disabledColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Gap(24.0),
            Row(
              children: [
                Expanded(
                  child: SquigglePattern(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Today",
                    style: AppTextStyles.small.copyWith(
                      color: disabledColor,
                    ),
                  ),
                ),
                Expanded(
                  child: WavySlider(
                    onChanged: (value) {},
                    color: disabledColor,
                    strokeWidth: 1.5,
                    value: 1,
                    waveWidth: 8,
                    waveHeight: 4,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
