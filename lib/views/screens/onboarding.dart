import 'package:clezigov/models/onboarding.dart';
import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/views/screens/auth/login/login.dart';
import 'package:clezigov/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  static const String routeName = '/onboard';

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          final data = onboardingData[index];

          return Column(
            children: [
              Expanded(
                child: Image.asset(
                  data.image,
                  fit: BoxFit.cover,
                  height: mediaHeight(context) / 1.8,
                  width: mediaWidth(context),
                ),
              ),
              Gap(24.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 24.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: allPadding / 2,
                      decoration: BoxDecoration(
                        color: seedColor.withOpacity(0.1),
                        borderRadius: borderRadius * 20,
                        border: Border.all(color: backgroundColor),
                      ),
                      child: IntrinsicWidth(
                        child: Row(
                          children: List.generate(
                            onboardingData.length,
                            (index) {
                              return AnimatedContainer(
                                duration: duration,
                                width: currentIndex == index ? 16.0 : 8.0,
                                height: 8.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? seedColor
                                      : seedColorPalette.shade200,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Gap(16.0),
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: nohemiFont,
                        color: darkColor,
                        fontVariations: const <FontVariation>[
                          FontVariation("wght", 600),
                        ],
                      ),
                    ),
                    Gap(16.0),
                    PrimaryButton.label(
                      onPressed: () {
                        if (currentIndex ==
                            onboardingData.indexOf(onboardingData.last)) {
                          // Go to login page using go router
                          context.go(LoginPage.routeName);
                        } else {
                          controller.nextPage(
                            duration: duration,
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      label: currentIndex ==
                              onboardingData.indexOf(onboardingData.last)
                          ? "Let's get started"
                          : "Proceed",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
