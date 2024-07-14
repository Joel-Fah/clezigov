import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/views/screens/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../widgets/form fields/simple_text_field.dart';
import '../../../widgets/primary_button.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  static const String routeName = '/resetPassword';

  @override
  Widget build(BuildContext context) {
    final _newPasswordFormKey = GlobalKey<FormState>();
    final TextEditingController _newPasswordController = TextEditingController();
    final TextEditingController _newPasswordConfirmController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reset password"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            Text(
              "Reset password",
              style: AppTextStyles.h2,
            ),
            Gap(8.0),
            Text(
              "You are now required to setup a new password to secure your account. Remain careful so as not to lose it again.",
              style: AppTextStyles.body,
            ),
            Gap(24.0),
            Form(
              key: _newPasswordFormKey,
              child: Column(
                children: [
                  SimpleTextFormField(
                    controller: _newPasswordController,
                    hintText: "New password",
                    prefixIcon: Icon(LucideIcons.keySquare),
                  ),
                  Gap(16.0),
                  SimpleTextFormField(
                    controller: _newPasswordConfirmController,
                    hintText: "Confirm new password",
                    prefixIcon: Icon(LucideIcons.lock),
                  ),
                  Gap(16.0),
                  PrimaryButton.label(
                    onPressed: () {
                      // Go to login page
                      if (_newPasswordFormKey.currentState!.validate()) {
                        context.go(LoginPage.routeName);
                      }
                    },
                    label: "Set new password",
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
