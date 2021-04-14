import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:user/Screens/Userdashboard/components/bookmark.dart';
import 'package:user/Screens/Userdashboard/components/events.dart';
import 'package:user/Screens/Userdashboard/components/games.dart';
import 'package:user/Screens/Userdashboard/components/home.dart';
import 'package:user/Screens/Userdashboard/components/userprofile.dart';

class Userdashboard extends StatefulWidget {
  @override
  Userdashboard({Key key}) : super(key: key);
  _UserdashboardState createState() => _UserdashboardState();
}

class _UserdashboardState extends State<Userdashboard> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<IconData> iconList = [
    Feather.home,
    Feather.grid,
    Feather.list,
    Feather.bookmark,
    Feather.user
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 400));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) async {});
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        gapWidth: 2,
        activeIndex: _currentIndex,
        inactiveColor: Colors.grey[800],
        onTap: (index) => onTabTapped(index),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Home(),
          Games(),
          Events(),
          Bookmark(),
          Userprofile(),
        ],
      ),
    );
  }
}
