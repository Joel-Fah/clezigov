import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/views/widgets/form_fields/simple_text_field.dart';
import 'package:clezigov/views/widgets/primary_button.dart';
import 'package:clezigov/views/widgets/tilt_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({super.key});

  static const String routeName = '/verify-account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Account'),
      ),
      body: ListView(
        padding: allPadding * 2,
        children: [
          Animate(
            effects: [FadeEffect(), MoveEffect()],
            child: SvgPicture.asset(
              verifiedAvatars,
              height: 100.0,
            ),
          ),
          Gap(32.0),
          UnconstrainedBox(
            child: Animate(
              effects: [FadeEffect(), ShimmerEffect()],
              onPlay: (controller) => controller.repeat(
                reverse: true,
                period: duration * 3,
              ),
              child: AnimatedContainer(
                duration: duration,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: disabledColor.withOpacity(0.1),
                  borderRadius: borderRadius * 2,
                ),
                child: Text(
                  "Pending...",
                  style: AppTextStyles.body.copyWith(
                    color: disabledColor,
                  ),
                ),
              ),
            ),
          ),
          Gap(8.0),
          Text(
            "Your account is pending verification. Please check your email for a verification link.",
            style: AppTextStyles.h2,
            textAlign: TextAlign.center,
          ),
          Gap(16.0),
          Text(
            "To ensure your account security and access to all features, please verify your email address. You'll receive a verification email shortly with a link to click. Once verified, you'll be ready to go!",
            style: AppTextStyles.body.copyWith(
              color: disabledColor,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(24.0),
          PrimaryButton.child(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                builder: (context) {
                  return BackdropFilter(
                    filter: blurFilter,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        AccountVerificationModal(),
                        Positioned(
                          top: -10.0,
                          right: 10.0,
                          child: IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(LucideIcons.x),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text(
              "Proceed to verification",
              style: AppTextStyles.body.copyWith(
                color: scaffoldBgColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountVerificationModal extends StatefulWidget {
  const AccountVerificationModal({super.key});

  @override
  State<AccountVerificationModal> createState() => _AccountVerificationModalState();
}

class _AccountVerificationModalState extends State<AccountVerificationModal> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String? verificationCode;
  bool isVerificationCodeFilled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        isVerificationCodeFilled = controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView(
        padding: allPadding * 2,
        shrinkWrap: true,
        children: [
          TiltIcon(
            icon: LucideIcons.rectangleHorizontal,
          ),
          Gap(8.0),
          Text(
            "Enter verification code",
            style: AppTextStyles.h2,
            textAlign: TextAlign.center,
          ),
          Gap(16.0),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "A verification code was sent to ",
                ),
                TextSpan(
                  text: "joelfah@clezi.org",
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                  ". Head over to your inbox, get the code and insert it here.",
                ),
              ],
            ),
            style: AppTextStyles.body,
          ),
          Gap(16.0),
          Form(
            key: formKey,
            child: Column(
              children: [
                SimpleTextFormField(
                  controller: controller,
                  hintText: "Enter verification code",
                  prefixIcon: Icon(LucideIcons.keySquare),
                  onChanged: (value) =>
                  verificationCode = value,
                ),
                Gap(20.0),
                PrimaryButton.label(
                  onPressed: isVerificationCodeFilled ? () {} : null,
                  label: "Verify account",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
