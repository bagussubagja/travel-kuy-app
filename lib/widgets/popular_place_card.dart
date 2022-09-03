// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

import '../core/place_notifier/popular_notifier.dart';
import '../core/place_notifier/recommended_notifier.dart';
import 'margin_widget_width.dart';

class PopularPlaceCard extends StatefulWidget {
  PopularPlaceCard({Key? key}) : super(key: key);

  @override
  State<PopularPlaceCard> createState() => _PopularPlaceCardState();
}

class _PopularPlaceCardState extends State<PopularPlaceCard> {
  List<String> imgUrl = [
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/mountain.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/mountain.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
  ];

  @override
  void initState() {
    super.initState();
    final popularModel = Provider.of<PopularClass>(context, listen: false);
    popularModel.getPopularPlace();
  }

  @override
  Widget build(BuildContext context) {
    final popularModel = Provider.of<PopularClass>(context);
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => MarginWidth(width: 10),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                placeModel: popularModel.popular?[index],
              );
            }));
          },
          child: Container(
            height: 200,
            width: 185,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: popularModel.popular?[index].gallery == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Image.network(
                            popularModel.popular![index].gallery[0],
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                MarginHeight(height: 8),
                Text(
                  popularModel.popular?[index].name ?? "Loading...",
                  style: regularText.copyWith(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: greyColor,
                      size: 12,
                    ),
                    MarginWidth(width: 5),
                    Expanded(
                      child: Text(
                        popularModel.popular?[index].province ?? 'Loading...',
                        style: subTitleText.copyWith(
                            color: greyColor, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
