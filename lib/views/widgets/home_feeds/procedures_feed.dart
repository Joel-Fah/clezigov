import 'package:card_swiper/card_swiper.dart';
import 'package:clezigov/controllers/bookmarks_controller.dart';
import 'package:clezigov/models/procedures/category.dart';
import 'package:clezigov/utils/routes.dart';
import 'package:clezigov/views/screens/home/procedure_details.dart';
import 'package:clezigov/views/widgets/home_feeds/procedures/recommended.dart';
import 'package:clezigov/views/widgets/tilt_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/procedures/procedures.dart';
import '../../../utils/constants.dart';
import '../../../utils/utility_functions.dart';

class ProceduresFeed extends StatelessWidget {
  const ProceduresFeed({
    super.key,
  });

  static const String routeName = '/procedures';

  @override
  Widget build(BuildContext context) {
    final BookmarksController bookmarksController =
        Get.find<BookmarksController>();

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(children: [
            TextSpan(text: "Hey "),
            TextSpan(
              text: "Joël Fah",
              style: AppTextStyles.h2.copyWith(
                color: seedColor,
              ),
            ),
            TextSpan(text: ",\nStart the day relaxed"),
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
                LucideIcons.search,
                color: seedColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListHeader(
            title: "Recommended",
          ),
          Animate(
            effects: [FadeEffect(), MoveEffect()],
            child: Swiper(
              layout: SwiperLayout.CUSTOM,
              customLayoutOption:
                  CustomLayoutOption(startIndex: -1, stateCount: 3)
                    ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                    ..addTranslate([
                      Offset(-368.0, -40.0),
                      Offset(0.0, 0.0),
                      Offset(368.0, -40.0),
                    ]),
              physics: const BouncingScrollPhysics(),
              duration: (duration.inMilliseconds * 2).toInt(),
              curve: Curves.decelerate,
              itemWidth: mediaWidth(context) - 70,
              itemHeight: 180,
              itemCount: procedures.length,
              itemBuilder: (context, index) {
                final Procedure procedure = procedures[index];
                return RecommendedProcedure(procedure: procedure);
              },
            ),
          ),
          Gap(16.0),
          ListHeader(
            title: "Popular categories",
          ),
          Gap(16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                categories.sublist(0, 5).length,
                (index) {
                  final Category category = categories.sublist(0, 5)[index];
                  final IconData? categoryIcon = categoryIcons[index][category];

                  return Container(
                    padding: allPadding * 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: borderRadius * 2.75,
                      boxShadow: [shadow],
                    ),
                    constraints: BoxConstraints(
                      minWidth: 112.0,
                    ),
                    child: Column(
                      children: [
                        TiltIcon(
                          icon: categoryIcon,
                          iconSize: 24.0,
                        ),
                        Gap(8.0),
                        Text(
                          category.name,
                          style: AppTextStyles.body,
                        )
                      ],
                    ),
                  );
                },
              )..add(GestureDetector(
                  onTap: () {
                    // Bottom sheet for categories
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      constraints: BoxConstraints(
                        maxHeight: mediaHeight(context) / 1.5,
                      ),
                      builder: (context) {
                        return Stack(
                          children: [
                            CategoriesList(searchController: searchController),
                            Positioned(
                              top: -10.0,
                              right: 10.0,
                              child: IconButton(
                                onPressed: () => context.pop(),
                                icon: Icon(LucideIcons.x),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: allPadding * 2,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: borderRadius * 2.75,
                      boxShadow: [shadow],
                    ),
                    constraints: BoxConstraints(
                      minWidth: 112.0,
                    ),
                    child: Column(
                      children: [
                        TiltIcon(
                          icon: LucideIcons.arrowUpRight,
                          iconSize: 24.0,
                        ),
                        Gap(8.0),
                        Text(
                          "More...",
                          style: AppTextStyles.body
                              .copyWith(color: scaffoldBgColor),
                        )
                      ],
                    ),
                  ),
                )),
            ),
          ),
          Gap(16.0),
          ListHeader(
            title: "Latest Updates",
          ),
          Gap(16.0),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: procedures.length,
            separatorBuilder: (context, index) => Divider(
              height: 0,
            ),
            itemBuilder: (context, index) {
              final Procedure procedure = procedures[index];

              return InkWell(
                onTap: () {
                  context.pushNamed(
                    removeBeginningSlash(ProcedureDetailsPage.routeName),
                    pathParameters: {'id': procedure.id},
                  );
                },
                overlayColor: WidgetStateProperty.all(Color(0xFFEBEAE9)),
                highlightColor: Color(0xFFEBEAE9),
                child: Padding(
                  padding: allPadding * 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getMonthAndYear(procedure.lastUpdatedAt),
                        style: AppTextStyles.small.copyWith(
                          color: disabledColor,
                        ),
                      ),
                      Hero(
                        tag: procedure.id,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            procedure.title,
                            style: AppTextStyles.h4,
                          ),
                        ),
                      ),
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
                                        LucideIcons.coins,
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
                                        LucideIcons.timer,
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
                                        LucideIcons.fileText,
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
                              GetBuilder<BookmarksController>(
                                  builder: (bookmarksController) {
                                final int bookmarksCount = bookmarksController
                                    .bookmarks
                                    .where(
                                        (element) => element.id == procedure.id)
                                    .length;

                                final bool isBookmarked = bookmarksController
                                    .bookmarks
                                    .contains(procedure);

                                return LikeButton(
                                  onTap: (isLiked) {
                                    if (isLiked) {
                                      bookmarksController
                                          .removeBookmark(procedure);
                                    } else {
                                      bookmarksController
                                          .addBookmark(procedure);
                                    }
                                    return Future.value(!isLiked);
                                  },
                                  likeBuilder: (isLiked) {
                                    return Icon(
                                      LucideIcons.bookmark,
                                      color: isLiked ? warningColor : darkColor,
                                      size: 16,
                                    );
                                  },
                                  isLiked: isBookmarked,
                                  circleColor: CircleColor(
                                    start: warningColor.withOpacity(0.16),
                                    end: warningColor.withOpacity(0.16),
                                  ),
                                  countBuilder: (count, isLiked, text) {
                                    return Text(
                                      count.toString(),
                                      style: AppTextStyles.body.copyWith(
                                        color:
                                            isLiked ? warningColor : darkColor,
                                      ),
                                    );
                                  },
                                  countPostion: CountPostion.right,
                                  likeCount: bookmarksCount > 0
                                      ? bookmarksCount
                                      : null,
                                );
                              }),
                              IconButton(
                                onPressed: () {
                                  Share.share(procedure.title);
                                },
                                icon: Icon(
                                  LucideIcons.share2,
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
          ),
        ],
      ),
    );
  }
}

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    // function to filter categories base on name
    // and return the search results
    final List<Category> allCategories = categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Categories (${categories.length})",
            style: AppTextStyles.h2,
          ),
        ),
        Gap(16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: formFieldDecoration,
            child: TextField(
              controller: widget.searchController,
              style: AppTextStyles.body,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  minHeight: 48.0,
                  maxHeight: 56.0,
                ),
                hintText: "Search for a category..",
                prefixIcon: Icon(LucideIcons.search),
                // show suffix button if search field is not empty
                suffixIcon: widget.searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(LucideIcons.x),
                        onPressed: () {
                          setState(() {
                            widget.searchController.clear();
                            categories = allCategories;
                          });
                        },
                      )
                    : null,
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: seedColor,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: dangerColor,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: dangerColor,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius * 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        Gap(16.0),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: categoryIcons.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius * 2,
                ),
                leading: Icon(
                  categoryIcons[index][categories[index]],
                  color: seedColor,
                ),
                title: Text(
                  categories[index].name,
                ),
                titleTextStyle: AppTextStyles.body.copyWith(
                  color: darkColor,
                ),
                trailing: Text(
                  "(#)",
                  style: AppTextStyles.body.copyWith(
                    color: disabledColor,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: AppTextStyles.h3,
      ),
    );
  }
}
