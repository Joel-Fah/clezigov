import 'dart:ui';

import 'package:clezigov/views/widgets/notification_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../utils/constants.dart';
import '../../widgets/home_feeds/clezi_bot.dart';
import '../../widgets/home_feeds/community_feed.dart';
import '../../widgets/home_feeds/procedures_feed.dart';
import '../../widgets/home_feeds/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentPage = 0;
  double tabBarHeight = 80.0;
  late TabController tabController;
  late AnimationController _hideTabBarAnimationController;
  late Animation<double> _offsetAnimation;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> _borderRadiusAnimation;

  final TextEditingController cleziController = TextEditingController();
  bool isCleziMessageFilled = false;

  // Tabs names
  final List<String> tabNames = [
    'Procedures',
    'Community',
    'Clezi',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: tabNames.length,
      vsync: this,
    );

    _hideTabBarAnimationController = AnimationController(
      duration: duration,
      vsync: this,
    );
    _offsetAnimation = Tween(begin: 0.0, end: tabBarHeight)
        .animate(_hideTabBarAnimationController)
      ..addListener(() {
        setState(() {});
      });
    _borderRadiusAnimationController = AnimationController(
      duration: duration,
      vsync: this,
    );
    _borderRadiusAnimation =
        Tween(begin: 28.0, end: 0.0).animate(_borderRadiusAnimationController)
          ..addListener(() {
            setState(() {});
          });
    tabController = TabController(
      length: tabNames.length,
      vsync: this,
    );

    cleziController.addListener(() {
      setState(() {
        isCleziMessageFilled = cleziController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _hideTabBarAnimationController.dispose();
    _borderRadiusAnimationController.dispose();
    cleziController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Page widgets
    final List<Widget> _kTabPages = <Widget>[
      ProceduresFeed(),
      CommunityFeed(),
      CleziBot(),
      ProfilePage(),
    ];

    final List<Widget> tabIcons = [
      Icon(LucideIcons.scrollText),
      Icon(LucideIcons.radio),
      Icon(LucideIcons.bot),
      AnimatedContainer(
        duration: duration,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: currentPage == 3 ? scaffoldBgColor : Colors.transparent,
                width: 1.5)),
        child: CircleAvatar(
          radius: 16.0,
          backgroundColor: seedColorPalette.shade700,
          backgroundImage: AssetImage(pfp),
        ),
      )
    ];

    return PieCanvas(
      theme: PieTheme(
        delayDuration: duration,
        overlayStyle: PieOverlayStyle.around,
        buttonThemeHovered: PieButtonTheme(
          backgroundColor: seedColorPalette.shade50,
          iconColor: seedColor,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [shadow],
            color: seedColorPalette.shade100,
          ),
        ),
        pointerColor: Colors.transparent,
        angleOffset: 5,
        childTiltEnabled: false,
        rightClickShowsMenu: true,
        tooltipTextStyle: AppTextStyles.h2,
      ),
      child: Scaffold(
        extendBody: true,
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              _hideTabBarAnimationController.forward();
              _borderRadiusAnimationController.forward();
            } else if (direction == ScrollDirection.forward) {
              _hideTabBarAnimationController.reverse();
              _borderRadiusAnimationController.reverse();
            }
            return true;
          },
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: _kTabPages,
          ),
        ),
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(88.0),
          child: AnimatedContainer(
            duration: duration,
            curve: Curves.decelerate,
            height: tabBarHeight - _offsetAnimation.value,
            constraints: BoxConstraints(
              maxWidth: mediaWidth(context) - 50,
            ),
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 16.0),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
              boxShadow: [
                BoxShadow(
                  color: seedColorPalette.shade100.withOpacity(0.5),
                  blurRadius: 8.0,
                  offset: Offset(0, 4.0),
                ),
              ],
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                physics: const NeverScrollableScrollPhysics(),
                splashBorderRadius: borderRadius * 5,
                overlayColor:
                    WidgetStateProperty.all<Color>(seedColorPalette.shade100),
                splashFactory: InkRipple.splashFactory,
                onTap: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                tabs: List.generate(
                  _kTabPages.length,
                  (index) {
                    final icon = tabIcons[index];
                    final title = tabNames[index];
                    return TabBuilder(
                      index: index,
                      currentIndex: currentPage,
                      icon: icon,
                      title: title,
                    );
                  },
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
                dividerHeight: 0.0,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: currentPage == 2 ? FloatingActionButtonLocation.centerFloat : null,
        floatingActionButton: Visibility(
          visible: currentPage == 2,
          child: AnimatedContainer(
                  duration: duration,
                  constraints: BoxConstraints(maxWidth: mediaWidth(context) - 80),
                  decoration: formFieldDecoration.copyWith(
                      borderRadius: borderRadius * 2.75),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      TextField(
                        controller: cleziController,
                        maxLines: 5,
                        minLines: 1,
                        textInputAction: TextInputAction.send,
                        textCapitalization: TextCapitalization.sentences,
                        style: AppTextStyles.body,
                        decoration: InputDecoration(
                          hintText: "Ask Clezi...",
                          suffixIcon: SizedBox(),
                          constraints: BoxConstraints(
                            minHeight: 48.0,
                            // maxHeight: 56.0,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: borderRadius * 2.75,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: borderRadius * 2.75,
                            borderSide: BorderSide(
                              color: seedColor,
                              width: 1.5,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: borderRadius * 2.75,
                            borderSide: BorderSide(
                              color: dangerColor,
                              width: 1.5,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: borderRadius * 2.75,
                            borderSide: BorderSide(
                              color: dangerColor,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: borderRadius * 2.75,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: borderRadius * 2.75,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        padding: allPadding * 2,
                        onPressed: isCleziMessageFilled
                            ? () {
                                showNotificationSnackBar(
                                  context: context,
                                  backgroundColor: successColor,
                                  icon: successIcon,
                                  message: "Message sent successfully",
                                );
                                cleziController.clear();
                              }
                            : null,
                        icon: Icon(
                          LucideIcons.send,
                          color: isCleziMessageFilled
                              ? seedColor
                              : disabledColor,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class TabBuilder extends StatelessWidget {
  const TabBuilder({
    super.key,
    required this.icon,
    required this.title,
    required this.currentIndex,
    required this.index,
  });

  final Widget icon;
  final String title;
  final int index, currentIndex;

  @override
  Widget build(BuildContext context) {
    if (index == currentIndex) {
      // Community tab
      if (index == 1) {
        return PieMenu(
          onToggle: (menuOpen) {
            if (menuOpen) {
              HapticFeedback.lightImpact();
            }
          },
          actions: [
            PieAction(
              tooltip: const Text('Submit procedure'),
              onSelect: () {
                showNotificationSnackBar(
                  context: context,
                  backgroundColor: successColor,
                  icon: successIcon,
                  message: "Submit procedure selected successfully",
                );
              },
              child: const Icon(LucideIcons.send),
            ),
            PieAction(
              tooltip: const Text('Request procedure'),
              onSelect: () {
                showNotificationSnackBar(
                  context: context,
                  backgroundColor: successColor,
                  icon: successIcon,
                  message: "Request procedure selected successfully",
                );
              },
              child: const Icon(LucideIcons.lightbulb),
            ),
          ],
          child: Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                Gap(8.0),
                Text(
                  title,
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        );
      }

      return Tooltip(
        message: title,
        child: Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              Gap(8.0),
              Text(
                title,
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      );
    }

    return Tooltip(
      message: title,
      child: Tab(
        icon: icon,
      ),
    );
  }
}
