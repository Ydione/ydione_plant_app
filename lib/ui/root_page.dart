import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ydione_plant_app/constants.dart';
import 'package:ydione_plant_app/ui/scan_page.dart';
import 'package:ydione_plant_app/ui/screens/cart_page.dart';
import 'package:ydione_plant_app/ui/screens/favorite_page.dart';
import 'package:ydione_plant_app/ui/screens/home_page.dart';
import 'package:ydione_plant_app/ui/screens/profile_page.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/rendering.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  // int _bottomNavIndex = 0;

  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  // List of the pages
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage()
  ];

  // List of the pages icons
  List<IconData> iconList = const [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  // List of the page titles
  List<String> titleList = const [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleList[_bottomNavIndex],
                  style: TextStyle(
                      color: Constants.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                Icon(
                  Icons.notifications,
                  color: Constants.blackColor,
                  size: 30.0,
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
        ),
        body: IndexedStack(
          index: _bottomNavIndex,
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const ScanPage(),
                    type: PageTransitionType.bottomToTop));
          },
          backgroundColor: Constants.primaryColor,
          child: Image.asset(
            'assets/images/code-scan-two.png',
            height: 30.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive
                ? Constants.primaryColor
                : Colors.black.withOpacity(.5);
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AutoSizeText(
                    "brightness $index",
                    maxLines: 1,
                    style: TextStyle(color: color),
                    group: autoSizeGroup,
                  ),
                )
              ],
            );
          },
          splashColor: Constants.primaryColor,
          notchAndCornersAnimation: borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          hideAnimationController: _hideBottomBarAnimationController,
          shadow: BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: Constants.primaryColor,
          ),
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
        ),
      ),
    );
  }
}
