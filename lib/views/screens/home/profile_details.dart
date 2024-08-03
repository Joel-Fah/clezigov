import 'package:cached_network_image/cached_network_image.dart';
import 'package:clezigov/models/procedures/category.dart';
import 'package:clezigov/utils/utility_functions.dart';
import 'package:clezigov/views/widgets/home_feeds/procedures_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../utils/constants.dart';
import '../../widgets/home_feeds/profile/profile_image_blur_painter.dart';
import '../../widgets/loading_builder.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage(
      {super.key, required this.imageColor, required this.image});

  static const String routeName = '/profile-details';
  final Color imageColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Information'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(HugeIcons.strokeRoundedMoreVertical),
            tooltip: 'More options',
            clipBehavior: Clip.hardEdge,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedEdit02,
                        size: 20.0,
                      ),
                      Gap(8.0),
                      Text(
                        "Edit profile",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  value: "edit",
                ),
                PopupMenuItem(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedInformationCircle,
                        size: 20.0,
                      ),
                      Gap(8.0),
                      Text(
                        "Help",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  value: "help",
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedFlag01,
                        size: 20.0,
                        color: dangerColor,
                      ),
                      Gap(8.0),
                      Text(
                        "Report",
                        style: AppTextStyles.body.copyWith(
                          color: dangerColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  value: "report",
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        children: [
          CustomPaint(
            painter: CircleBlurPainter(
              circleWidth: 150.0,
              blurSigma: 100.0,
              color: imageColor.withOpacity(.2),
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => LoadingBuilder(
                primaryColor: imageColor,
                secondaryColor: imageColor.withOpacity(.3),
              ),
              imageBuilder: (context, imageProvider) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: allPadding,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: imageColor.withOpacity(.3),
                          width: 2.0,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Animate(
                        effects: [FadeEffect(), MoveEffect()],
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: imageColor.withOpacity(.1),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                          constraints: BoxConstraints(
                            maxHeight: 150.0,
                            maxWidth: 150.0,
                          ),
                        ),
                      ),
                    ),
                    IntrinsicWidth(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: imageColor.withGreen(10),
                              borderRadius: borderRadius * 1.75,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  HugeIcons.strokeRoundedCheckmarkBadge01,
                                  color: scaffoldBgColor,
                                  size: 16.0,
                                ),
                                Gap(8.0),
                                Text(
                                  "contributor",
                                  style: AppTextStyles.small.copyWith(
                                    color: scaffoldBgColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Gap(4.0),
                          Container(
                            padding: allPadding,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius * 1.75,
                              color: imageColor,
                            ),
                            child: Icon(
                              HugeIcons.strokeRoundedImageAdd01,
                              size: 16.0,
                              color: scaffoldBgColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Gap(16.0),
          Text(
            "Tap to change your profile picture",
            style: AppTextStyles.small.copyWith(
              color: disabledColor,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(20.0),
          ListHeader(title: "Personal"),
          Gap(8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: allPadding * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius * 2.75,
                boxShadow: [shadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Full name",
                    title: "DEJON FAH Joel Xavier",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 2.0,
                    ),
                  ),
                  ProfileDetailsItem(
                      accentColor: imageColor,
                      subtitle: "Residence city",
                      title: "Yaounde"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 2.0,
                    ),
                  ),
                  ProfileDetailsItem(
                      accentColor: imageColor,
                      subtitle: "Occupation",
                      title: "Student"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 2.0,
                    ),
                  ),
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Gender",
                    title: "Male",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 2.0,
                    ),
                  ),
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Date joined",
                    title: getFormattedDate(DateTime.now()),
                  ),
                ],
              ),
            ),
          ),
          Gap(20.0),
          ListHeader(title: "Credentials"),
          Gap(8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: allPadding * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius * 2.75,
                boxShadow: [shadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Sign in method",
                    title: "Google authentication",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 2.0,
                    ),
                  ),
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Username",
                    title: "@joel__fah",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 2.0,
                    ),
                  ),
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Password",
                    title: "●" * 12,
                    action: TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style?.copyWith(
                            overlayColor: WidgetStateProperty.all(
                              seedColor.withOpacity(.1),
                            ),
                          ),
                      child: Text(
                        "Change password",
                        style: AppTextStyles.small.copyWith(
                          color: seedColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(20.0),
          ListHeader(title: "Contacts"),
          Gap(8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: allPadding * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius * 2.75,
                boxShadow: [shadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Email address",
                    title: "joelfah@clezi.com",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 2.0,
                    ),
                  ),
                  ProfileDetailsItem(
                    accentColor: imageColor,
                    subtitle: "Phone number",
                    title: "+237 6 99 99 99 99",
                  ),
                ],
              ),
            ),
          ),
          Gap(20.0),
          ListHeader(title: "Interests"),
          Gap(8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
                padding: allPadding * 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius * 2.75,
                  boxShadow: [shadow],
                ),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(
                    categories.sublist(5).length,
                    (index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: imageColor.withOpacity(.1),
                          borderRadius: borderRadius * 2,
                        ),
                        child: Text(
                          categories.sublist(5)[index].name,
                          style: AppTextStyles.body.copyWith(
                            color: imageColor,
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class ProfileDetailsItem extends StatelessWidget {
  const ProfileDetailsItem({
    super.key,
    required this.accentColor,
    required this.title,
    required this.subtitle,
    this.action,
  });

  final Color accentColor;
  final String title, subtitle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: AppTextStyles.small.copyWith(
                  color: accentColor,
                ),
              ),
              Gap(8.0),
              Text(
                title,
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
        action ?? SizedBox.shrink(),
      ],
    );
  }
}
