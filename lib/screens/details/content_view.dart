import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/recommended_card.dart';

import '../../shared/theme.dart';
import '../../widgets/margin_widget_width.dart';
import 'overview_widget.dart';

class ContentView extends StatefulWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 325,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/mountain.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: blackBackgroundColor.withOpacity(0.25),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                            )),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: blackBackgroundColor.withOpacity(0.25),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: whiteColor,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 210,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blackBackgroundColor.withOpacity(0.25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gunung Rinjani',
                            style: titleText.copyWith(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: whiteColor,
                                size: 18,
                              ),
                              MarginWidth(width: 3),
                              Text('Jawa Barat', style: regularText),
                            ],
                          ),
                          MarginHeight(height: 5),
                          Row(
                            children: [
                              RatingBar.builder(
                                ignoreGestures: true,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                                itemCount: 5,
                                initialRating: 4.5,
                                allowHalfRating: true,
                                itemSize: 20,
                              ),
                              MarginWidth(width: 3),
                              Text('4.6 (Popular)',
                                  style:
                                      subTitleText.copyWith(color: whiteColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: detailPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: TabBar(
                        isScrollable: true,
                        indicatorColor: greenDarkerColor,
                        controller: _tabController,
                        labelColor: whiteColor,
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        unselectedLabelColor: greyColor,
                        tabs: [
                          Tab(
                            text: 'Overview',
                          ),
                          Tab(
                            text: 'Review',
                          ),
                        ]),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 555,
                child: TabBarView(controller: _tabController, children: [
                  OverviewWidget(),
                  Text('data2'),
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
