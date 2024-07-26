import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clezigov/models/procedures/procedures.dart';
import 'package:clezigov/utils/utility_functions.dart';
import 'package:clezigov/views/widgets/loading_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:lucide_icons/lucide_icons.dart';

import '../../../controllers/sliver_scroll_controller.dart';
import '../../../utils/constants.dart';

class ProcedureDetailsPage extends StatelessWidget {
  const ProcedureDetailsPage({super.key, required this.procedure});

  static const routeName = '/procedure-details';
  final Procedure procedure;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration _cardDecoration = BoxDecoration(
      color: Colors.white,
      boxShadow: [shadow],
      borderRadius: borderRadius * 2,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: mediaHeight(context) / 2,
            pinned: true,
            snap: false,
            floating: false,
            backgroundColor: scaffoldBgColor,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: procedure.images[1].path,
                placeholder: (context, url) => Center(
                  child: LoadingBuilder(),
                ),
                errorWidget: (context, url, error) => Container(
                  height: mediaHeight(context),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        backgroundColor.withOpacity(0.1),
                        backgroundColor.withOpacity(0.9),
                        backgroundColor,
                      ],
                      stops: [0.0, 0.75, 0.96],
                    ),
                  ),
                ),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: mediaHeight(context) / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      color: backgroundColor,
                    ),
                    child: Container(
                      padding: allPadding * 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            backgroundColor.withOpacity(0.0),
                            backgroundColor.withOpacity(0.9),
                            backgroundColor,
                          ],
                          stops: [0.0, 0.75, 0.96],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            getMonthAndYear(procedure.lastUpdatedAt),
                            style: AppTextStyles.small.copyWith(
                              color: scaffoldBgColor.withOpacity(0.5),
                            ),
                          ),
                          Gap(8.0),
                          Hero(
                            tag: procedure.id,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                procedure.title,
                                style: AppTextStyles.h2.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Gap(16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ProcedureActionCard(
                                  onTap: () {},
                                  icon: LucideIcons.headphones,
                                  title: "Contacts",
                                ),
                              ),
                              Gap(8.0),
                              Expanded(
                                child: ProcedureActionCard(
                                  onTap: () {},
                                  icon: LucideIcons.map,
                                  title: "Directions",
                                ),
                              ),
                              Gap(8.0),
                              Expanded(
                                child: ProcedureActionCard(
                                  onTap: () {},
                                  icon: LucideIcons.listTodo,
                                  title: "ToDo",
                                ),
                              ),
                              Gap(8.0),
                              Expanded(
                                child: ProcedureActionCard(
                                  onTap: () {},
                                  icon: LucideIcons.hardHat,
                                  title: "Agent",
                                  backgroundColor: seedColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // forceMaterialTransparency: true,
            title: InvisibleExpandedHeader(
              child: Animate(
                effects: [FadeEffect(), MoveEffect()],
                child: Text("Procedure"),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(LucideIcons.bookmark),
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                icon: Icon(LucideIcons.moreVertical),
                tooltip: 'More',
                clipBehavior: Clip.hardEdge,
                itemBuilder: (context) {
                  return [
                    PopupMenuDivider(),
                    PopupMenuItem(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.flagTriangleLeft,
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
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: kToolbarHeight,
              maxHeight: kToolbarHeight,
              child: Visibility(
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(LucideIcons.headphones),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(LucideIcons.map),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(LucideIcons.listTodo),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(LucideIcons.hardHat),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListView(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Places
                    Container(
                      padding: allPadding * 1.5,
                      decoration: _cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Place(s) where you can achieve this",
                            style: AppTextStyles.small.copyWith(
                              color: disabledColor,
                            ),
                          ),
                          Gap(8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CircleAvatar(
                                    radius: 2.5,
                                    backgroundColor: darkColor,
                                  ),
                                ),
                                Gap(8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sub-divisional office (SDO)",
                                      style: AppTextStyles.body,
                                    ),
                                    Gap(4.0),
                                    Text(
                                      "open (Mon - Fri, 8:00am - 3:00pm)",
                                      style: AppTextStyles.small.copyWith(
                                        color: successColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap(16.0),
                    // Description
                    GetBuilder<ProcedureDescriptionController>(
                      builder: (descriptionController) {
                        return AnimatedContainer(
                          duration: duration,
                          padding: allPadding * 1.5,
                          decoration: _cardDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned.fill(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    "Procedure description",
                                    style: AppTextStyles.small.copyWith(
                                      color: disabledColor,
                                    ),
                                  ),
                                ),
                              ),
                              Gap(8.0),
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Text(
                                    procedure.description,
                                    // maxLines: descriptionController
                                    //         .isDescriptionExpanded
                                    //     ? null
                                    //     : 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     descriptionController.toggleDescription();
                                  //   },
                                  //   child: Container(
                                  //     padding: EdgeInsets.symmetric(
                                  //       horizontal: 8.0,
                                  //       vertical: 2.0,
                                  //     ),
                                  //     decoration: BoxDecoration(
                                  //       color: scaffoldBgColor.withOpacity(0.5),
                                  //       borderRadius: borderRadius,
                                  //     ),
                                  //     clipBehavior: Clip.hardEdge,
                                  //     child: BackdropFilter(
                                  //       filter: blurFilter,
                                  //       child: Text(
                                  //         descriptionController
                                  //                 .isDescriptionExpanded
                                  //             ? "Read less"
                                  //             : "Read more",
                                  //         style: AppTextStyles.body.copyWith(
                                  //             color: seedColor,
                                  //             fontWeight: FontWeight.w600),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class ProcedureActionCard extends StatelessWidget {
  const ProcedureActionCard({
    super.key,
    this.onTap,
    this.backgroundColor,
    required this.icon,
    required this.title,
  });

  final Function()? onTap;
  final Color? backgroundColor;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius * 2,
        highlightColor: backgroundColor?.withOpacity(0.2) ??
            scaffoldBgColor.withOpacity(0.2),
        overlayColor: WidgetStateProperty.all<Color>(
          backgroundColor?.withOpacity(0.2) ?? scaffoldBgColor.withOpacity(0.2),
        ),
        child: BackdropFilter(
          filter: blurFilter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            decoration: BoxDecoration(
              borderRadius: borderRadius * 2,
              color: backgroundColor ?? scaffoldBgColor.withOpacity(0.16),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: scaffoldBgColor,
                ),
                Gap(8.0),
                Text(title,
                    style: AppTextStyles.small
                        .copyWith(color: scaffoldBgColor, fontSize: 14.0))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InvisibleExpandedHeader extends StatefulWidget {
  final Widget child;

  const InvisibleExpandedHeader({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _InvisibleExpandedHeaderState createState() {
    return _InvisibleExpandedHeaderState();
  }
}

class _InvisibleExpandedHeaderState extends State<InvisibleExpandedHeader> {
  ScrollPosition? _position;
  bool? isVisible;

  bool? get isVisibleValue => isVisible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (isVisible != visible) {
      setState(() {
        isVisible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible ?? false,
      child: widget.child,
    );
  }
}
