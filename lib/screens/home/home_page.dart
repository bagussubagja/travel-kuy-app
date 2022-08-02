import 'package:flutter/material.dart';
import 'package:travel_kuy_app/screens/home/body_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/category_card.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SizedBox(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hi, ',
                          style: subTitleText.copyWith(color: whiteColor),
                        ),
                        Text(
                          'Bagus Subagja 👋',
                          style: subTitleText.copyWith(
                              fontWeight: FontWeight.w500, color: whiteColor),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: greenDarkerColor,
                      radius: 25,
                      child: CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: 20,
                        child: Image.asset(
                          'assets/images/avatar.png',
                        ),
                      ),
                    )
                  ],
                ),
                MarginHeight(height: 15),
                Text(
                  'Explore and Find your Best Journey!',
                  style: titleText,
                ),
                MarginHeight(height: 15),
                Text(
                  'Where would you like to go?',
                  style: regularText,
                ),
                MarginHeight(height: 15),
                CategoryCard(),
                MarginHeight(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Destination',
                      style: regularText,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: regularText.copyWith(color: greenDarkerColor),
                        )),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
