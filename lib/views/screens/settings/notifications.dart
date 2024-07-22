import 'package:clezigov/controllers/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../widgets/home_feeds/procedures_feed.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static const String routeName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: GetBuilder<NotificationsController>(builder: (notifications) {
        return ListView(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          children: [
            ListHeader(title: 'Notifications'),
            Gap(8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Customize your notification preferences to receive alerts for the things that interest you. Procedures, community, endorsements and more... it’s up to you.',
                style: AppTextStyles.body,
              ),
            ),
            Gap(16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedContainer(
                duration: duration * 2,
                padding: allPadding * 2,
                decoration: BoxDecoration(
                  color: notifications.newProceduresValue
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: borderRadius * 2.75,
                  boxShadow: notifications.newProceduresValue ? [shadow] : null,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "New procedures",
                    style: AppTextStyles.body,
                  ),
                  trailing: Switch(
                    value: notifications.newProceduresValue,
                    activeColor: Colors.white,
                    activeTrackColor: seedColor,
                    onChanged: (value) {
                      notifications.toggleProceduresValue();
                    },
                  ),
                ),
              ),
            ),
            Gap(16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedContainer(
                duration: duration * 2,
                padding: allPadding * 2,
                decoration: BoxDecoration(
                  color: notifications.communityActivityValue
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: borderRadius * 2.75,
                  boxShadow:
                      notifications.communityActivityValue ? [shadow] : null,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Community activity",
                    style: AppTextStyles.body,
                  ),
                  subtitle: Text(
                    "Submission reviews, endorsements",
                    style: AppTextStyles.body.copyWith(
                      color: disabledColor,
                      fontSize: 14.0,
                    ),
                  ),
                  trailing: Switch(
                    value: notifications.communityActivityValue,
                    activeColor: Colors.white,
                    activeTrackColor: seedColor,
                    onChanged: (value) {
                      notifications.toggleCommunityValue();
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
