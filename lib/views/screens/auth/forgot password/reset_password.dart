import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/views/screens/auth/login/login.dart';
import 'package:clezigov/views/widgets/form_fields/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../widgets/primary_button.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  static const String routeName = '/resetPassword';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _newPasswordFormKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  // Form fields
  String? _newPassword, _confirmNewPassword;

  // Form validation
  bool isNewPasswordFilled = false, isConfirmNewPasswordFilled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newPasswordController.addListener(() {
      setState(() {
        isNewPasswordFilled = _newPasswordController.text.isNotEmpty;
      });
    });

    _confirmNewPasswordController.addListener(() {
      setState(() {
        isConfirmNewPasswordFilled =
            _confirmNewPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                  PasswordTextFormField(
                    controller: _newPasswordController,
                    hintText: "New password",
                    prefixIcon: Icon(LucideIcons.keySquare),
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) => _newPassword = value,
                  ),
                  Gap(16.0),
                  PasswordTextFormField(
                    controller: _confirmNewPasswordController,
                    hintText: "Confirm new password",
                    prefixIcon: Icon(LucideIcons.lock),
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) => _confirmNewPassword = value,
                  ),
                  Gap(16.0),
                  PrimaryButton.label(
                    onPressed: (isNewPasswordFilled &&
                            isConfirmNewPasswordFilled)
                        ? () {
                            // Go to login page
                            if (_newPasswordFormKey.currentState!.validate()) {
                              context.go(LoginPage.routeName);
                            }
                          }
                        : null,
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
