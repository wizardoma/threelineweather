import 'package:flutter/material.dart';
import 'package:threelineweather/ui/today/today_screen.dart';
import 'package:threelineweather/ui/weekly/weekly_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currNavIndex = 0;

  late List<Widget> _children;

  @override
  void initState() {
    _children = [
      TodayScreen(),
      WeeklyScreen(),
      Container(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getNavBar(),
      body: _children[_currNavIndex],
    );
  }

  BottomNavigationBar getNavBar() {
    return BottomNavigationBar(
        currentIndex: _currNavIndex,
        onTap: (index) {
          if (index == 2) {
            print("share");
            return;
          }
          setState(() {
            _currNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Today"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_week), label: "Weekly"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "Share"),
        ]);
  }
}
