import 'package:clezigov/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../widgets/form_fields/simple_text_field.dart';
import '../../../widgets/buttons/primary_button.dart';
import 'email_verification.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String routeName = '/forgot-password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  String? _email;
  bool isEmailFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener((){
      setState(() {
        isEmailFilled = _emailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                    prefixIcon: Icon(HugeIcons.strokeRoundedMail02),
                    onChanged: (value) => _email = value,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }

                      if (!RegExp(emailRegex).hasMatch(value)) {
                        return "Invalid email address";
                      }

                      return null;
                    },
                  ),
                  Gap(16.0),
                  PrimaryButton.label(
                    onPressed: isEmailFilled ? () {
                      // Go to email verification page
                      if (_forgotPasswordFormKey.currentState!.validate()) {
                        context.push(
                          EmailVerificationPage.routeName,
                          extra: {"email": _email},
                        );
                      }
                    } : null,
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
