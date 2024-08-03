import 'package:clezigov/utils/routes.dart';
import 'package:clezigov/views/screens/auth/forgot%20password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/constants.dart';
import '../../../widgets/form_fields/simple_text_field.dart';
import '../../../widgets/buttons/primary_button.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key, required this.email});
  static const String routeName = '/email-verification';
  final String email;

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _codeVerificationFormKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _codeVerificationController =
  TextEditingController();

  // Form fields
  String? _code;

  // Form validation
  bool isCodeFilled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _codeVerificationController.addListener(() {
      setState(() {
        isCodeFilled = _codeVerificationController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                    text: widget.email,
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
                    prefixIcon: Icon(HugeIcons.strokeRoundedPinCode),
                    onChanged: (value) => _code = value,
                  ),
                  Gap(16.0),
                  PrimaryButton.label(
                    onPressed: isCodeFilled
                        ? () {
                      // Go to email verification page
                      if (_codeVerificationFormKey.currentState!.validate()) {
                        context.goPush(ResetPasswordPage.routeName);
                      }
                    } : null,
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