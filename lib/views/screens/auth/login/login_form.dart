import 'dart:async';

import 'package:clezigov/utils/routes.dart';
import 'package:clezigov/views/screens/auth/forgot%20password/forgot_password.dart';
import 'package:clezigov/views/widgets/notification_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/constants.dart';
import '../../../widgets/form_fields/password_form_field.dart';
import '../../../widgets/form_fields/simple_text_field.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/tilt_icon.dart';
import '../register/user_registration.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({
    super.key,
  });

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final _loginFormKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Forms fields
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _loginFormKey,
          child: ListView(
            shrinkWrap: true,
            padding: allPadding * 1.25,
            children: [
              TiltIcon(
                icon: HugeIcons.strokeRoundedMailLock02,
              ),
              Gap(8.0),
              Text(
                "Sign in with your email and password",
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              Gap(24.0),
              SimpleTextFormField(
                controller: _emailController,
                hintText: "Email address or username",
                prefixIcon: Icon(HugeIcons.strokeRoundedMailAtSign02),
                onChanged: (value) => username = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email address or username is required";
                  }
                  return null;
                },
              ),
              Gap(16.0),
              PasswordTextFormField(
                controller: _passwordController,
                hintText: "Password",
                prefixIcon: Icon(HugeIcons.strokeRoundedLockPassword),
                onChanged: (value) => password = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              Gap(8.0),
              Align(
                alignment: Alignment.centerRight,
                child: IntrinsicWidth(
                  child: TextButton(
                    onPressed: () {
                      // Go to forgot password page
                      context.goPush(ForgotPasswordPage.routeName);
                    },
                    style: TextButtonTheme.of(context).style?.copyWith(
                          overlayColor: WidgetStateProperty.all<Color>(
                            seedColorPalette.shade50,
                          ),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                              StadiumBorder()),
                        ),
                    child: Text(
                      "Forgot password?",
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                        color: seedColor,
                        fontSize: 14.0,
                        decoration: TextDecoration.underline,
                        decorationColor: seedColor,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(24.0),
              PrimaryButton.label(
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {
                    // delayed pop
                    Future.delayed(
                      duration * 4,
                      () => context.pop(),
                    );

                    // show success notification
                    showNotificationSnackBar(
                      context: context,
                      message: "Hurray, you're in! Welcome back.",
                      backgroundColor: successColor,
                      icon: successIcon,
                    );
                  }
                },
                label: "Login into my account",
              ),
              Gap(8.0),
              PrimaryButton.label(
                onPressed: () {
                  // Go to register page
                  context.goPush(UserRegistrationPage.routeName);
                },
                label: "Sign up instead",
                backgroundColor: seedColorPalette.shade50,
                labelColor: seedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
