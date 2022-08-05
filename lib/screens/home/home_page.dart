import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/category_card.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/most_viewed_card.dart';
import 'package:travel_kuy_app/widgets/newly_added_card.dart';
import 'package:travel_kuy_app/widgets/popular_card.dart';
import 'package:travel_kuy_app/widgets/recommended_card.dart';

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
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 120),
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
                          style: regularText.copyWith(
                              color: whiteColor, fontSize: 18),
                        ),
                        Text(
                          'Bagus Subagja 👋',
                          style: regularText.copyWith(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18),
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
                MarginHeight(height: 10),
                PopularCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Just for you ',
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
                RecommendedCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Viewed',
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
                MostViewCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Newly Added ',
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
                NewlyAddedCard()
              ],
            ),
          ),
        )),
      ),
    );
  }
}
