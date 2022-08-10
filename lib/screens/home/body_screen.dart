import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:travel_kuy_app/screens/home/favorites_page.dart';
import 'package:travel_kuy_app/screens/home/home_page.dart';
import 'package:travel_kuy_app/screens/home/search_page.dart';
import 'package:travel_kuy_app/screens/home/setting_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      horizontalPadding: 10,
      resizeToAvoidBottomInset: false,
      borderRadius: 12,
      selectedIconColor: greenDarkerColor,
      unselectedIconColor: Colors.white.withOpacity(0.5),
      items: [
        FloatingNavBarItem(
          iconData: Icons.home,
          title: 'Home',
          page: HomeScreen(),
        ),
        FloatingNavBarItem(
          iconData: Icons.favorite,
          title: 'Favorite',
          page: const FavoritesPage(),
        ),
        FloatingNavBarItem(
          iconData: Icons.calendar_month_rounded,
          title: 'Search',
          page: const SearchPage(),
        ),
        FloatingNavBarItem(
          iconData: Icons.settings,
          title: 'Setting',
          page: const SettingPage(),
        ),
      ],
      color: Colors.black.withOpacity(0.75),
      hapticFeedback: true,
    );
  }
}
