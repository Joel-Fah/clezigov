import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  static const String routeName = '/onboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Why are you here...?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(24.0),
              PrimaryButton.label(
                onPressed: () {},
                backgroundColor: successColor, label: 'I am here to learn',
              ),
              SizedBox(
                width: Get.width,
                height: 48.0,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('I am here to teach'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
