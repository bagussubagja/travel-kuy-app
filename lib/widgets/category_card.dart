// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/screens/authentication/login_screen.dart';
import 'package:travel_kuy_app/screens/authentication/register_screen.dart';
import 'package:travel_kuy_app/screens/home/favorite/favorites_page.dart';
import 'package:travel_kuy_app/screens/home/home_page.dart';
import 'package:travel_kuy_app/screens/home/schedule_page.dart';
import 'package:travel_kuy_app/screens/home/setting_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final List<String> imgCategory = [
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/lake.png',
    'assets/images/mountain.jpg',
    'assets/images/park.png',
    'assets/images/waterfall.jpg',
  ];

  final List<String> titleCategory = [
    'Beach',
    'Island',
    'Lake',
    'Mountain',
    'Park',
    'Waterfall',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        separatorBuilder: (context, index) => MarginWidth(width: 12),
        scrollDirection: Axis.horizontal,
        itemCount: imgCategory.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => print(index),
          child: Container(
            height: 60,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withAlpha(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 65,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imgCategory[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    titleCategory[index],
                    style: regularText.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
