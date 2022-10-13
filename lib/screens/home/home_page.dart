import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/user_notifier/user_notifier.dart';
import 'package:travel_kuy_app/screens/categories/by_status/mostview_place_page.dart';
import 'package:travel_kuy_app/screens/categories/by_status/newlyadded_place_page.dart';
import 'package:travel_kuy_app/screens/categories/by_status/popular_place_page.dart';
import 'package:travel_kuy_app/screens/categories/by_status/recommended_place_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/most_viewed_card.dart';
import 'package:travel_kuy_app/widgets/newly_added_card.dart';
import 'package:travel_kuy_app/widgets/recommended_place_card.dart';
import 'package:travel_kuy_app/widgets/popular_place_card.dart';

import '../categories/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserClass>(context, listen: false);
    ReadCache.getString(key: "cache").then((value) {
      user.getUserData(idUser: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SizedBox(
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: defaultPadding,
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
                          '${user.user?[0].name ?? 'Loading...'} 👋',
                          style: regularText.copyWith(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    user.user?[0].gender == "Male"
                        ? CircleAvatar(
                            backgroundColor: greyColor,
                            radius: 25,
                            child: CircleAvatar(
                              backgroundColor: whiteColor,
                              radius: 20,
                              child: Image.asset(
                                'assets/images/avatar.png',
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: greyColor,
                            radius: 25,
                            child: CircleAvatar(
                              backgroundColor: whiteColor,
                              radius: 20,
                              child: Image.asset(
                                'assets/images/avatar1.png',
                              ),
                            ),
                          )
                  ],
                ),
                MarginHeight(height: 15),
                Text(
                  'Explore and Find your Best Journey!',
                  style: titleText.copyWith(fontSize: 22),
                ),
                MarginHeight(height: 15),
                Text(
                  'Where would you like to go?',
                  style: regularText,
                ),
                MarginHeight(height: 15),
                const CategoryCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommendation for you',
                      style: regularText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RecommendedPlacePage();
                          }));
                        },
                        child: Text(
                          'See All',
                          style: regularText.copyWith(color: greenDarkerColor),
                        )),
                  ],
                ),
                MarginHeight(height: 10),
                const RecommendedPlaceCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Destination',
                      style: regularText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PopularPlacePage();
                          }));
                        },
                        child: Text(
                          'See All',
                          style: regularText.copyWith(color: greenDarkerColor),
                        )),
                  ],
                ),
                const PopularPlaceCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Viewed',
                      style: regularText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MostViewPlacePage();
                          }));
                        },
                        child: Text(
                          'See All',
                          style: regularText.copyWith(color: greenDarkerColor),
                        )),
                  ],
                ),
                const MostViewCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Newly Added ',
                      style: regularText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NewlyAddedPlacePage();
                          }));
                        },
                        child: Text(
                          'See All',
                          style: regularText.copyWith(color: greenDarkerColor),
                        )),
                  ],
                ),
                const NewlyAddedCard()
              ],
            ),
          ),
        )),
      ),
    );
  }
}
