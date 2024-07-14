import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../widgets/form fields/simple_text_field.dart';
import '../../../widgets/primary_button.dart';
import 'email_verification.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static const String routeName = '/forgotPassword';

  @override
  Widget build(BuildContext context) {
    final _forgotPasswordFormKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            Text(
              "We are so sorry you can’t remember your password. Let us know your email.",
              style: AppTextStyles.h2,
            ),
            Gap(8.0),
            Text(
              "We will need your email to help you recover your account.",
              style: AppTextStyles.body,
            ),
            Gap(24.0),
            Form(
              key: _forgotPasswordFormKey,
              child: Column(
                children: [
                  SimpleTextFormField(
                    controller: _emailController,
                    hintText: "Email address",
                    prefixIcon: Icon(LucideIcons.atSign),
                  ),
                  Gap(16.0),
                  PrimaryButton.label(
                    onPressed: () {
                      // Go to email verification page
                      if (_forgotPasswordFormKey.currentState!.validate()) {
                        context.goPush(EmailVerificationPage.routeName);
                      }
                    },
                    label: "Verify email",
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
