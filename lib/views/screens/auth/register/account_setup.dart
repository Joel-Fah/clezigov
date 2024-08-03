import 'package:clezigov/utils/routes.dart';
import 'package:clezigov/views/screens/auth/register/points_of_interests.dart';
import 'package:clezigov/views/widgets/form_fields/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../utils/constants.dart';
import '../../../widgets/form_fields/password_form_field.dart';
import '../../../widgets/buttons/primary_button.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});
  static const String routeName = '/account-setup';

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  final _accountSetupFormKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Form fields
  String? _email, _phoneNumber, _username, _password, _confirmPassword;

  // Form validation
  bool isEmailFilled = false,
      isPhoneNumberFilled = false,
      isUsernameFilled = false,
      isPasswordFilled = false,
      isConfirmPasswordFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        isEmailFilled = _emailController.text.isNotEmpty;
      });
    });

    _phoneNumberController.addListener(() {
      setState(() {
        isPhoneNumberFilled = _phoneNumberController.text.isNotEmpty;
      });
    });

    _userNameController.addListener(() {
      setState(() {
        isUsernameFilled = _userNameController.text.isNotEmpty;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        isPasswordFilled = _passwordController.text.isNotEmpty;
      });
    });

    _confirmPasswordController.addListener(() {
      setState(() {
        isConfirmPasswordFilled = _confirmPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account setup"),
      ),
      body: Form(
        key: _accountSetupFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            Text(
              "Setup your account",
              style: AppTextStyles.h2,
            ),
            Gap(8.0),
            Text(
              "Setup a username, and password together with some other important information.",
              style: AppTextStyles.body,
            ),
            Gap(8.0),
            Row(
              children: [
                Icon(
                  HugeIcons.strokeRoundedInformationCircle,
                  color: Theme.of(context).disabledColor,
                  size: 16.0,
                ),
                Gap(8.0),
                Expanded(
                  child: Text(
                    "If you instead want to sign up with your Google account or Apple ID, go back to the previous screen.",
                    style: AppTextStyles.small.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                )
              ],
            ),
            Gap(20.0),
            SimpleTextFormField(
              controller: _emailController,
              hintText: "Email address",
              prefixIcon: Icon(HugeIcons.strokeRoundedMail02),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => _email = value,
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
            SimpleTextFormField(
              controller: _phoneNumberController,
              hintText: "Phone number",
              prefixIcon: Icon(HugeIcons.strokeRoundedCall02),
              keyboardType: TextInputType.phone,
              onChanged: (value) => _phoneNumber = value,
            ),
            Gap(16.0),
            Divider(),
            Gap(16.0),
            SimpleTextFormField(
              controller: _userNameController,
              hintText: "Set a username",
              prefixIcon: Icon(HugeIcons.strokeRoundedUserCircle),
              onChanged: (value) => _username = value,
            ),
            Gap(16.0),
            PasswordTextFormField(
              controller: _passwordController,
              hintText: "New password",
              prefixIcon: Icon(HugeIcons.strokeRoundedKey02),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => _password = value,
            ),
            Gap(16.0),
            PasswordTextFormField(
              controller: _confirmPasswordController,
              hintText: "Confirm new password",
              prefixIcon: Icon(HugeIcons.strokeRoundedLockKey),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => _confirmPassword = value,
            ),
            Gap(24.0),
            PrimaryButton.label(
              onPressed: (isEmailFilled &&
                      isPhoneNumberFilled &&
                      isUsernameFilled &&
                      isPasswordFilled &&
                      isConfirmPasswordFilled)
                  ? () {
                      if (_accountSetupFormKey.currentState!.validate()) {
                        // Save and proceed
                        context.goPush(PointsOfInterestsPage.routeName);
                      }
                    }
                  : null,
              label: "Save and proceed",
            ),
          ],
        ),
      ),
    );
  }
}
