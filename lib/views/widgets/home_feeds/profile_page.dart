import 'package:cached_network_image/cached_network_image.dart';
import 'package:clezigov/utils/routes.dart';
import 'package:clezigov/views/screens/home/verify_account.dart';
import 'package:clezigov/views/screens/settings/appearance.dart';
import 'package:clezigov/views/screens/settings/community_activity.dart';
import 'package:clezigov/views/screens/settings/notifications.dart';
import 'package:clezigov/views/widgets/home_feeds/procedures_feed.dart';
import 'package:clezigov/views/widgets/home_feeds/profile/profile_image_blur_painter.dart';
import 'package:clezigov/views/widgets/loading_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../utils/constants.dart';
import '../../screens/home/profile_details.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.image,
    required this.imageColor,
  });

  final String image;
  final Color imageColor;

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBgColor.withOpacity(0),
        title: Text.rich(
          TextSpan(children: [
            TextSpan(text: "Need "),
            TextSpan(
              text: "tweaks",
              style: AppTextStyles.h2.copyWith(
                color: seedColor,
              ),
            ),
            TextSpan(text: "?\nWe got you, feel free!"),
          ]),
          style: AppTextStyles.h2.copyWith(
            fontFamily: nohemiFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: seedColorPalette.shade50,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              splashColor: seedColorPalette.shade100,
              highlightColor: seedColorPalette.shade100,
              padding: allPadding * 2,
              icon: Icon(
                HugeIcons.strokeRoundedPieChart,
                color: seedColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16.0),
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
                      child: Container(
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
                    )
                  ],
                );
              },
            ),
          ),
          Gap(24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  "DEJON FAH Joël Xavier",
                  style: AppTextStyles.h3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      HugeIcons.strokeRoundedAttachment,
                      size: 16.0,
                      color: imageColor,
                    ),
                    Gap(2.0),
                    Text(
                      "joel__fah",
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "joelfah@gmail.com",
                      style: AppTextStyles.small.copyWith(
                        color: disabledColor,
                      ),
                    ),
                    Gap(8.0),
                    CircleAvatar(
                      radius: 2.5,
                      backgroundColor: disabledColor.withOpacity(0.8),
                    ),
                    Gap(8.0),
                    Text(
                      "Since 15/5/2023",
                      style: AppTextStyles.small.copyWith(
                        color: disabledColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(20.0),
          ListHeader(title: "Personal"),
          Gap(8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: allPadding,
              decoration: BoxDecoration(
                borderRadius: borderRadius * 2.75,
                color: Colors.white,
                boxShadow: [shadow],
              ),
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.push(
                          ProfileDetailsPage.routeName,
                          extra: {
                            'imageColor': imageColor,
                            'image': image,
                          }
                        );
                      },
                      borderRadius: borderRadius * 2,
                      highlightColor: Color(0xFFEBEAE9),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius * 2,
                        ),
                        leading: Icon(
                          HugeIcons.strokeRoundedId,
                          color: imageColor,
                        ),
                        title: Text("Profile Information"),
                        trailing: Icon(
                          HugeIcons.strokeRoundedArrowRight01,
                          color: imageColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.goPush(VerifyAccountPage.routeName);
                      },
                      borderRadius: borderRadius * 2,
                      highlightColor: Color(0xFFEBEAE9),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius * 2,
                        ),
                        leading: Icon(
                          HugeIcons.strokeRoundedUserCheck01,
                          color: imageColor,
                        ),
                        title: Text("Verify account"),
                        trailing: Icon(
                          HugeIcons.strokeRoundedArrowRight01,
                          color: imageColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: borderRadius * 2,
                      highlightColor: Color(0xFFEBEAE9),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius * 2,
                        ),
                        leading: Icon(
                          HugeIcons.strokeRoundedAllBookmark,
                          color: imageColor,
                        ),
                        title: Text("Bookmarks"),
                        trailing: Icon(
                          HugeIcons.strokeRoundedArrowRight01,
                          color: imageColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.goPush(CommunityActivityPage.routeName);
                      },
                      borderRadius: borderRadius * 2,
                      highlightColor: Color(0xFFEBEAE9),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius * 2,
                        ),
                        leading: Icon(
                          HugeIcons.strokeRoundedActivity03,
                          color: imageColor,
                        ),
                        title: Text("Community activity"),
                        trailing: Icon(
                          HugeIcons.strokeRoundedArrowRight01,
                          color: imageColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(20.0),
          ListHeader(title: "Settings"),
          Gap(8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: allPadding,
              decoration: BoxDecoration(
                borderRadius: borderRadius * 2.75,
                color: Colors.white,
                boxShadow: [shadow],
              ),
              child: Column(children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.goPush(AppearancePage.routeName);
                    },
                    borderRadius: borderRadius * 2,
                    highlightColor: Color(0xFFEBEAE9),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: borderRadius * 2,
                      ),
                      leading: Icon(
                        HugeIcons.strokeRoundedIdea01,
                        color: imageColor,
                      ),
                      title: Text("Appearance"),
                      trailing: Icon(
                        HugeIcons.strokeRoundedArrowRight01,
                        color: imageColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.goPush(NotificationsPage.routeName);
                    },
                    borderRadius: borderRadius * 2,
                    highlightColor: Color(0xFFEBEAE9),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: borderRadius * 2,
                      ),
                      leading: Icon(
                        HugeIcons.strokeRoundedNotification03,
                        color: imageColor,
                      ),
                      title: Text("Notifications"),
                      trailing: Icon(
                        HugeIcons.strokeRoundedArrowRight01,
                        color: imageColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: borderRadius * 2,
                    highlightColor: Color(0xFFEBEAE9),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: borderRadius * 2,
                      ),
                      leading: Icon(
                        HugeIcons.strokeRoundedShield01,
                        color: imageColor,
                      ),
                      title: Text("Privacy"),
                      trailing: Icon(
                        HugeIcons.strokeRoundedArrowRight01,
                        color: imageColor,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Gap(20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: seedColorPalette.shade50,
                borderRadius: borderRadius * 2,
                boxShadow: [shadow],
              ),
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: borderRadius * 2,
                      highlightColor: seedColorPalette.shade100,
                      overlayColor:
                          WidgetStateProperty.all(seedColorPalette.shade100),
                      child: ListTile(
                        leading: Icon(HugeIcons.strokeRoundedAlertDiamond),
                        title: Text("Legal"),
                        trailing: Icon(
                          HugeIcons.strokeRoundedArrowUpRight02,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF4E4E1),
                borderRadius: borderRadius * 2,
                boxShadow: [shadow],
              ),
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: borderRadius * 2,
                      highlightColor: dangerColor.withOpacity(0.16),
                      overlayColor: WidgetStateProperty.all(
                          dangerColor.withOpacity(0.16)),
                      child: ListTile(
                        leading: Icon(
                          HugeIcons.strokeRoundedLogout03,
                          color: dangerColor,
                        ),
                        title: Text("Log out"),
                        textColor: dangerColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(20.0),
          Text(
            "v1.0.0",
            style: AppTextStyles.small.copyWith(
              color: disabledColor,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
