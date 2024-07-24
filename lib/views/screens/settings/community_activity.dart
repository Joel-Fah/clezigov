import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../widgets/home_feeds/settings/statistics_view.dart';

class CommunityActivityPage extends StatefulWidget {
  const CommunityActivityPage({super.key});

  static const routeName = '/community-activity';

  @override
  State<CommunityActivityPage> createState() => _CommunityActivityPageState();
}

class _CommunityActivityPageState extends State<CommunityActivityPage>
    with SingleTickerProviderStateMixin {
  // tab bar controller
  late TabController _tabController;

  List<String> tabNames = [
    "Statistics",
    "Submissions",
    "Requests",
    "Endorsed",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabNames.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabPages = [
      StatisticsView(),
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
      Center(
        child: Text(
          "Endorsed",
          style: AppTextStyles.h1.copyWith(
            fontFamily: nohemiFont,
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Community activity'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(32.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: TabBar(
              controller: _tabController,
              splashBorderRadius: borderRadius,
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
              tabs: tabNames
                  .map(
                    (tab) => Tab(
                      text: tab,
                      height: 24.0,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabPages,
      ),
    );
  }
}