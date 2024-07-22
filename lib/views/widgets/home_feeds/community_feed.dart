import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../utils/constants.dart';

enum CommunityFeedTabs {
  all,
  submissions,
  requests,
}

class CommunityFeed extends StatelessWidget {
  const CommunityFeed({
    super.key,
  });
  static const String routeName = '/community-feed';

  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(
      length: CommunityFeedTabs.values.length,
      vsync: Navigator.of(context),
    );

    final List<String> tabs = CommunityFeedTabs.values
        .map((element) => element.name.replaceFirst(
              element.name[0],
              element.name[0].toUpperCase(),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(children: [
            TextSpan(text: "Because your\n"),
            TextSpan(
              text: "contributions",
              style: AppTextStyles.h2.copyWith(
                color: seedColor,
              ),
            ),
            TextSpan(text: " matter"),
          ]),
          style: AppTextStyles.h2.copyWith(
            fontFamily: nohemiFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(32.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: TabBar(
                controller: tabController,
                splashBorderRadius: borderRadius * 2,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                unselectedLabelColor: disabledColor,
                labelColor: seedColor,
                labelStyle: AppTextStyles.small,
                indicator: BoxDecoration(
                  color: seedColorPalette.shade50,
                  borderRadius: borderRadius,
                ),
                overlayColor:
                    WidgetStateProperty.all(disabledColor.withOpacity(0.1)),
                tabs: tabs
                    .map(
                      (tab) => Tab(
                        text: tab,
                        height: 24.0,
                      ),
                    )
                    .toList(),
              ),
            )),
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
                LucideIcons.search,
                color: seedColor,
              ),
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AllContributions(),
          Center(
            child: Text(
              "Submissions",
              style: AppTextStyles.h1.copyWith(
                fontFamily: nohemiFont,
              ),
            ),
          ),
          Center(
            child: Text(
              "Requests",
              style: AppTextStyles.h1.copyWith(
                fontFamily: nohemiFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AllContributions extends StatelessWidget {
  const AllContributions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: allPadding * 2,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(mailbox),
          Gap(16.0),
          Text(
            "Can’t find this on how to do that?\nLet us know what bright ideas you’re having.",
            style: AppTextStyles.h4.copyWith(
              color: disabledColor,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(16.0),
          Row(
            children: [
              Icon(LucideIcons.target, size: 20.0, color: disabledColor,),
              Gap(16.0),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Long press", style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextSpan(text: " on the community tab to "),
                      TextSpan(text: "submit a procedure", style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextSpan(text: " or "),
                      TextSpan(text: "request for one.", style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),),
                    ]
                  ),
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14.0,
                    color: disabledColor,
                  ),
                ),
              )
            ],
          ),
          Gap(16.0),
          Row(
            children: [
              Icon(LucideIcons.hand, size: 20.0, color: disabledColor,),
              Gap(16.0),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "If your request already features within the community requests, we recommend to "),
                      TextSpan(text: "endorse", style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextSpan(text: " that request rather than submitting a new one."),
                    ]
                  ),
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14.0,
                    color: disabledColor,
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
