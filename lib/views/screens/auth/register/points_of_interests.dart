import 'package:clezigov/models/procedures/category.dart';
import 'package:clezigov/utils/routes.dart';
import 'package:clezigov/views/widgets/select_procedures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../controllers/select_categories_controller.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/primary_button.dart';
import '../../home/home.dart';

class PointsOfInterestsPage extends StatelessWidget {
  const PointsOfInterestsPage({super.key});

  static const String routeName = '/points-of-interests';

  @override
  Widget build(BuildContext context) {
    final selectedCategories = Get.find<InterestsController>();
    bool isSelected = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Points of interest"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          Text(
            "Procedures of interest",
            style: AppTextStyles.h2,
          ),
          Gap(8.0),
          Text(
            "Select the administrative procedures you’re interested in from the list below to personalize your experience.",
            style: AppTextStyles.body,
          ),
          Gap(8.0),
          Row(
            children: [
              Icon(
                LucideIcons.info,
                color: Theme
                    .of(context)
                    .disabledColor,
                size: 16.0,
              ),
              Gap(8.0),
              Expanded(
                child: Text(
                  "If you instead want to sign up with your Google account or Apple ID, go back to the previous screen.",
                  style: AppTextStyles.small.copyWith(
                    color: Theme
                        .of(context)
                        .disabledColor,
                  ),
                ),
              )
            ],
          ),
          Gap(24.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(
              categories.length,
                  (index) {
                final Category category = categories[index];

                return GetBuilder<InterestsController>(
                    builder: (interestsLogic) {
                      final bool isSelected =
                      interestsLogic.selectedInterests.contains(category);
                      return ChoiceChip(
                        label: Text(
                          category.name,
                          style: AppTextStyles.body,
                        ),
                        labelStyle: AppTextStyles.body.copyWith(
                          color: isSelected ? scaffoldBgColor : darkColor,
                        ),
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(),
                        side: BorderSide(width: 0.0, color: Colors.transparent),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        tooltip: category.name,
                        showCheckmark: isSelected,
                        pressElevation: 4.0,
                        selected: isSelected,
                        checkmarkColor: scaffoldBgColor,
                        selectedColor: seedColor,
                        onSelected: (value) {
                          isSelected
                              ? interestsLogic.removeFromInterest(category)
                              : interestsLogic.addToInterests(category);

                          debugPrint(
                              "Selected Interests: ${interestsLogic
                                  .selectedInterests}");
                        },
                      );
                    });
              },
            ),
          ),
          Gap(24.0),
          Obx(() {
            return Column(
              children: [
                PrimaryButton.label(
                  label: 'Submit and register',
                  onPressed: selectedCategories.selectedInterests.length >= 3
                      ? () {
                    // show success bottom sheet
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (context) {
                        return BackdropFilter(
                          filter: blurFilter,
                          child: ListView(
                            shrinkWrap: true,
                            padding: allPadding * 1.25,
                            children: [
                              SvgPicture.asset(userAvatars),
                              Gap(8.0),
                              Text(
                                "Registration successful",
                                style: AppTextStyles.h2.copyWith(
                                  color: successColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Gap(8.0),
                              Text(
                                "You are officially a member of of the CleziGov community. Make sure to explore all the features and information you get here.",
                                style: AppTextStyles.body,
                                textAlign: TextAlign.center,
                              ),
                              Gap(24.0),
                              PrimaryButton.label(
                                onPressed: () {
                                  // TODO: Go to home page
                                  context.goPush(HomePage.routeName);
                                },
                                label: "Explore right away!",
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                      : null,
                ),
                Gap(8.0),
                Visibility(
                  visible: selectedCategories.selectedInterests.length < 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.alertTriangle, color: warningColor, size: 16.0,),
                      Gap(8.0),
                      Text(
                        "You must select at least 3 points of interests",
                        style: AppTextStyles.small.copyWith(color: warningColor),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
