import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/views/widgets/primary_button.dart';
import 'package:clezigov/views/widgets/tilt_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../widgets/secondary_button.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: mediaHeight(context) / 4,
                  width: mediaWidth(context),
                  constraints: BoxConstraints(
                    maxHeight: 160.0,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                  child: Image.asset(
                    logoLight,
                    width: mediaWidth(context) / 2,
                  ),
                ),
                Gap(24.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Welcome back",
                          style: AppTextStyles.h1,
                        ),
                      ),
                      Gap(8.0),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Please choose how you want to sign in.",
                          style: AppTextStyles.body,
                        ),
                      ),
                      Gap(24.0),
                      Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          PrimaryButton.child(
                            onPressed: () {},
                            backgroundColor: dangerColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(googleLogo),
                                Gap(16.0),
                                Text(
                                  "Sign in with Google",
                                  style: AppTextStyles.body.copyWith(
                                    color: scaffoldBgColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(16.0),
                          PrimaryButton.child(
                            onPressed: () {},
                            backgroundColor: darkColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.apple,
                                  color: scaffoldBgColor,
                                  size: 32.0,
                                ),
                                Gap(16.0),
                                Text(
                                  "Sign in with Apple",
                                  style: AppTextStyles.body.copyWith(
                                    color: scaffoldBgColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(16.0),
                          SecondaryButton.label(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: false,
                                builder: (context) {
                                  return BackdropFilter(
                                    filter: blurFilter,
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        LoginModal(),
                                        Positioned(
                                          right: 10.0,
                                          child: IconButton(
                                            onPressed: () => context.pop(),
                                            icon: Icon(LucideIcons.x),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            label: "Sign in with email/password",
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 20.0,
              child: Text(
                "v1.0.3",
                style: AppTextStyles.small.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
