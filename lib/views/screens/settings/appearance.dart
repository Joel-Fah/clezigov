import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/views/screens/settings/language_selection.dart';
import 'package:clezigov/views/widgets/home_feeds/procedures_feed.dart';
import 'package:clezigov/views/widgets/home_feeds/profile/profile_image_blur_painter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppearancePage extends StatelessWidget {
  const AppearancePage({super.key});

  static const String routeName = "/appearance";

  @override
  Widget build(BuildContext context) {
    Language? _language;

    return Scaffold(
      appBar: AppBar(
        title: Text("Appearance"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        children: [
          ListHeader(title: "Theme"),
          Gap(8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Switch between light and dark theme or just set it to your device’s default.",
              style: AppTextStyles.body,
            ),
          ),
          Gap(56.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ThemeCard(
                  title: "Light\nTheme",
                  image: sun3d,
                  blurColor: Color(0xFFFFBF35),
                  alignment: Alignment.topLeft,
                  left: -16.0,
                  cardColor: Colors.white,
                ),
                ThemeCard(
                  title: "Device's\nTheme",
                  image: lightBulb3d,
                  blurColor: Color(0xFFFFD148),
                  cardColor: Colors.white,
                ),
                ThemeCard(
                  title: "Dark\nTheme",
                  titleColor: scaffoldBgColor,
                  image: crescentMoon3d,
                  blurColor: Color(0xFF8A65B4),
                  alignment: Alignment.topRight,
                  right: -16.0,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2C59A3),
                      Color(0xFF030326),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
          ),
          Gap(24.0),
          ListHeader(
            title: "Display language",
          ),
          Gap(8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Choose the language that will be used to display texts within the app.",
              style: AppTextStyles.body,
            ),
          ),
          Gap(8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LanguageSelection(
              onChanged: (value) {
                _language = value;
              },
            ),
          )
        ],
      ),
    );
  }
}

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    super.key,
    this.alignment,
    required this.blurColor,
    required this.image,
    this.right,
    this.left,
    required this.title,
    this.gradient,
    this.cardColor,
    this.titleColor,
    this.borderColor,
  });

  final AlignmentGeometry? alignment;
  final Color blurColor;
  final LinearGradient? gradient;
  final Color? cardColor, titleColor, borderColor;
  final String image, title;
  final double? right, left;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: UnconstrainedBox(
        child: Stack(
          alignment: alignment ?? Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: duration,
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                  alignment: Alignment.bottomCenter,
                  height: 180.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: borderRadius * 2.75,
                    gradient: gradient,
                    border: Border.all(
                      color: borderColor ?? Colors.transparent,
                      width: 2.0,
                    ),
                    boxShadow: [shadow],
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 200.0,
                  ),
                  child: Text(
                    title,
                    style: AppTextStyles.body.copyWith(color: titleColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.checkCircle2,
                        size: 16.0,
                        color: disabledColor,
                      ),
                      Gap(8.0),
                      Text(
                        "Selected",
                        style: AppTextStyles.small.copyWith(
                          color: disabledColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: -24.0,
              right: right,
              left: left,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: CircleBlurPainter(
                      circleWidth: 4.0,
                      blurSigma: 8.0,
                      color: blurColor,
                    ),
                    child: Image.asset(
                      image,
                      scale: 0.8,
                    ),
                  ),
                  Image.asset(
                    image,
                    scale: 0.8,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
