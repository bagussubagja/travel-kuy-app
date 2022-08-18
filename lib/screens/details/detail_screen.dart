import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indonesia/indonesia.dart';
import 'package:switch_tab/switch_tab.dart';
import 'package:travel_kuy_app/screens/details/overview_page.dart';
import 'package:travel_kuy_app/screens/details/review_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/custom_nav_button.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int indexPage = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/images/beach.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomNavButton(
                            bgColor: Colors.black.withOpacity(0.5),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back, color: whiteColor),
                            ),
                          ),
                          CustomNavButton(
                            bgColor: isFavorite
                                ? Colors.black.withOpacity(0.5)
                                : Colors.pink.withOpacity(0.5),
                            child: IconButton(
                                onPressed: () {
                                  setState(() => isFavorite = !isFavorite);
                                },
                                icon: isFavorite
                                    ? Icon(
                                        Icons.favorite_border_rounded,
                                        color: whiteColor,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
                                      )),
                          )
                        ],
                      ),
                      Positioned(
                        top: 240,
                        left: 20,
                        right: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Gunung Rinjani', style: titleText),
                                  MarginHeight(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: greyColor,
                                        size: 20,
                                      ),
                                      MarginWidth(width: 5),
                                      Text('Jawa Timur', style: subTitleText),
                                    ],
                                  ),
                                  MarginHeight(height: 5),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: 4.6,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                      MarginWidth(width: 5),
                                      Text('4.6', style: subTitleText),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MarginHeight(height: 75),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SwitchTab(
                      backgroundColour: Colors.black.withOpacity(0.25),
                      text: const ["Overview", "Reviews"],
                      selectedTextColor: whiteColor,
                      unselectedTextColor: greyColor,
                      shape: SwitchTabShape.rounded,
                      thumbColor: greenDarkerColor,
                      onValueChanged: (index) {
                        setState(() {
                          indexPage = index;
                        });
                      },
                    ),
                  ),
                  indexPage == 0 ? const OverviewPage() : ReviewPage(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.black87,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Column(
                        children: [
                          Text(
                            rupiah(1500000),
                            style: regularText,
                          ),
                          Text(
                            '/person',
                            style: regularText,
                          ),
                        ],
                      ),
                    ),
                    MarginWidth(width: 20),
                    Expanded(
                        child: SizedBox(
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: 400,
                                  decoration: BoxDecoration(
                                      color: blackBackgroundColor,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Close'),
                                    ),
                                  ));
                            },
                          );
                        },
                        style:
                            ElevatedButton.styleFrom(primary: greenDarkerColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Now',
                              style: regularText,
                            ),
                            MarginWidth(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
