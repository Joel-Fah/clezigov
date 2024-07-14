import 'package:clezigov/utils/routes.dart';
import 'package:clezigov/views/screens/auth/forgot%20password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../utils/constants.dart';
import '../../../widgets/form fields/simple_text_field.dart';
import '../../../widgets/primary_button.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key, required this.email});
  static const String routeName = '/emailVerification';
  final String email;

  @override
  Widget build(BuildContext context) {
    final _codeVerificationFormKey = GlobalKey<FormState>();
    final TextEditingController _codeVerificationController =
        TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Email verification"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            Text(
              "Verify it’s you",
              style: AppTextStyles.h2,
            ),
            Gap(8.0),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "A passcode has been sent to "),
                TextSpan(
                    text: email ?? "joelfah2003@gmail.com",
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(text: ". Enter the code below and verify."),
              ]),
              style: AppTextStyles.body,
            ),
            Gap(24.0),
            Form(
              key: _codeVerificationFormKey,
              child: Column(
                children: [
                  SimpleTextFormField(
                    controller: _codeVerificationController,
                    hintText: "Enter verification code",
                    prefixIcon: Icon(LucideIcons.rectangleHorizontal),
                  ),
                  Gap(16.0),
                  PrimaryButton.label(
                    onPressed: () {
                      // Go to email verification page
                      if (_codeVerificationFormKey.currentState!.validate()) {
                        context.goPush(ResetPasswordPage.routeName);
                      }
                    },
                    label: "Verify code",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
