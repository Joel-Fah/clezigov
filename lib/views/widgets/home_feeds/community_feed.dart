import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:like_button/like_button.dart';
import 'package:share_plus/share_plus.dart';

import '../../../controllers/endorsements_controller.dart';
import '../../../models/procedures/procedures.dart';
import '../../../utils/constants.dart';
import '../../../utils/utility_functions.dart';

enum CommunityFeedTabs {
  all,
  submissions,
  requests,
}

class CommunityFeed extends StatefulWidget {
  const CommunityFeed({
    super.key,
  });

  static const String routeName = '/community-feed';

  @override
  State<CommunityFeed> createState() => _CommunityFeedState();
}

class _CommunityFeedState extends State<CommunityFeed>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: CommunityFeedTabs.values.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              tabs: tabs
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
              icon: const Icon(
                HugeIcons.strokeRoundedSearch01,
                color: seedColor,
              ),
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AllContributions(),
          SubmittedContributions(),
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

class SubmittedContributions extends StatelessWidget {
  const SubmittedContributions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: procedures.length,
      separatorBuilder: (context, index) => Divider(
        height: 0,
      ),
      itemBuilder: (context, index) {
        final Procedure procedure = procedures[index];

        return InkWell(
          onTap: () {},
          overlayColor: WidgetStateProperty.all(Color(0xFFEBEAE9)),
          highlightColor: Color(0xFFEBEAE9),
          child: Padding(
            padding: allPadding * 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10.0,
                      backgroundImage: AssetImage(pfp),
                    ),
                    Gap(8.0),
                    Text("@joel__fah}", style: AppTextStyles.small),
                    Gap(8.0),
                    CircleAvatar(
                      radius: 2.5,
                      backgroundColor: disabledColor.withOpacity(0.5),
                    ),
                    Gap(8.0),
                    Text(
                      getMonthAndYear(procedure.lastUpdatedAt),
                      style: AppTextStyles.small.copyWith(
                        color: disabledColor,
                      ),
                    ),
                  ],
                ),
                Gap(4.0),
                Text(procedure.title, style: AppTextStyles.h4),
                Gap(8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  HugeIcons.strokeRoundedMoney03,
                                  color: disabledColor,
                                  size: 16.0,
                                ),
                                Gap(4.0),
                                Expanded(
                                  child: Text(
                                    "${addThousandSeparator(procedure.price.toInt().toString())} F",
                                    style: AppTextStyles.small.copyWith(
                                      fontSize: 14.0,
                                      color: disabledColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(16.0),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  HugeIcons.strokeRoundedClock05,
                                  color: disabledColor,
                                  size: 16.0,
                                ),
                                Gap(4.0),
                                Expanded(
                                  child: Text(
                                    "~${convertToReadableTime(procedure.estimatedTimeToComplete)}",
                                    style: AppTextStyles.small.copyWith(
                                      fontSize: 14.0,
                                      color: disabledColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(16.0),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  HugeIcons.strokeRoundedDocumentAttachment,
                                  color: disabledColor,
                                  size: 16.0,
                                ),
                                Gap(4.0),
                                Text(
                                  "x${procedure.documents.length}",
                                  style: AppTextStyles.small.copyWith(
                                    fontSize: 14.0,
                                    color: disabledColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        GetBuilder<EndorsementsController>(
                            builder: (bookmarksController) {
                          final int bookmarksCount = bookmarksController
                              .endorsements
                              .where((element) => element.id == procedure.id)
                              .length;

                          final bool isBookmarked = bookmarksController
                              .endorsements
                              .contains(procedure);

                          return LikeButton(
                            onTap: (isLiked) {
                              if (isLiked) {
                                bookmarksController.removeBookmark(procedure);
                              } else {
                                bookmarksController.addBookmark(procedure);
                              }
                              return Future.value(!isLiked);
                            },
                            likeBuilder: (isLiked) {
                              return Icon(
                                HugeIcons.strokeRoundedHold05,
                                color: isLiked ? seedColor : darkColor,
                                size: 16,
                              );
                            },
                            isLiked: isBookmarked,
                            circleColor: CircleColor(
                              start: seedColor.withOpacity(0.16),
                              end: seedColor.withOpacity(0.16),
                            ),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: seedColor,
                              dotSecondaryColor: seedColorPalette.shade100,
                            ),
                            countBuilder: (count, isLiked, text) {
                              return Text(
                                count.toString(),
                                style: AppTextStyles.body.copyWith(
                                  color: isLiked ? seedColor : darkColor,
                                ),
                              );
                            },
                            countPostion: CountPostion.right,
                            likeCount:
                                bookmarksCount > 0 ? bookmarksCount : null,
                          );
                        }),
                        IconButton(
                          onPressed: () {
                            Share.share(procedure.title);
                          },
                          icon: Icon(
                            HugeIcons.strokeRoundedShare08,
                            size: 16.0,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
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
              Icon(
                HugeIcons.strokeRoundedTouchInteraction04,
                size: 20.0,
                color: disabledColor,
              ),
              Gap(16.0),
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Long press",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: " on the community tab to "),
                    TextSpan(
                      text: "submit a procedure",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: " or "),
                    TextSpan(
                      text: "request for one.",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
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
              Icon(
                HugeIcons.strokeRoundedHold05,
                size: 20.0,
                color: disabledColor,
              ),
              Gap(16.0),
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text:
                            "If your request already features within the community requests, we recommend to "),
                    TextSpan(
                      text: "endorse",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14.0,
                        color: disabledColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                        text:
                            " that request rather than submitting a new one."),
                  ]),
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
