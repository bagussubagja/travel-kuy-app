import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_kuy_app/screens/home/favorite/favorites_page.dart';
import 'package:travel_kuy_app/screens/home/home_page.dart';
import 'package:travel_kuy_app/screens/home/schedule/schedule_page.dart';
import 'package:travel_kuy_app/screens/home/setting_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class BodyScreen extends StatefulWidget {
  BodyScreen({Key? key}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  List<Widget> _bodyScreen = [HomeScreen(), FavoritesPage(), SchedulePage(), SettingPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: _currentIndex == 0 ? const Icon(Icons.home) : const Icon(Icons.home_outlined),
            title: const Text("Home"),
            selectedColor: greenLightColor,
            unselectedColor: greyColor
          ),
          SalomonBottomBarItem(
            icon: _currentIndex == 1 ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
            title: const Text("Favorites"),
              selectedColor: greenLightColor,
              unselectedColor: greyColor
          ),
          SalomonBottomBarItem(
            icon: _currentIndex == 2 ? const Icon(Icons.calendar_month_rounded) : const Icon(Icons.calendar_month_outlined),
            title: const Text("Schedule"),
              selectedColor: greenLightColor,
              unselectedColor: greyColor
          ),
          SalomonBottomBarItem(
            icon: _currentIndex == 3 ? const Icon(Icons.settings) : const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
              selectedColor: greenLightColor,
              unselectedColor: greyColor
          ),
        ],
      ),
      body: _bodyScreen[_currentIndex],
    );
  }
}
