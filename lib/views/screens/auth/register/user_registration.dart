import 'package:clezigov/views/widgets/form%20fields/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../utils/constants.dart';

class UserRegistrationPage extends StatelessWidget {
  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          Text(
            "Hey, welcome to you 👋🏽",
            style: AppTextStyles.h2,
          ),
          Gap(8.0),
          Text(
            "We are happy to have you among us. Let’s begin by knowing each other.",
            style: AppTextStyles.body,
          ),
          Gap(8.0),
          Row(
            children: [
              Icon(LucideIcons.info),
              Gap(8.0),
              Text(
                "If you instead want to sign up with your Google account or Apple ID, go back to the previous screen.",
                style: AppTextStyles.small.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              )
            ],
          ),
          Gap(20.0),
          SimpleTextFormField(
            controller: _nameController,
            hintText: "How should we call you?",
            prefixIcon: Icon(LucideIcons.user2),
            textCapitalization: TextCapitalization.words,
          )
        ],
      ),
    );
  }
}
