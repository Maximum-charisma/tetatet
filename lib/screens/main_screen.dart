// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tetatet/screens/achivements_screen.dart';
import 'package:tetatet/screens/games_screen.dart';
import 'package:tetatet/screens/settings_screen.dart';
// import 'package:tetatet/services/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final List<BottomNavigationBarItem> _tabBar = [
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.gamepad),
    label: "Игры",
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.crown),
    label: "Достижения",
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.user),
    label: "Настройки",
  ),
];

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  // User? user;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
    // if (user == null) {
    //   loginAno(user);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromRGBO(144, 105, 250, 1),
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: _tabBar,
      ),
      // backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: const [GamesScreen(), AchivementsScreen(), SettingsScreen()],
      ),
    );
  }
}
