// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/statues_place_notifier.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

import '../screens/details/detail_screen.dart';

class MostViewCard extends StatefulWidget {
  const MostViewCard({Key? key}) : super(key: key);

  @override
  State<MostViewCard> createState() => _MostViewCardState();
}

class _MostViewCardState extends State<MostViewCard> {
  List<String> imgUrl = [
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
    'assets/images/beach.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
  ];

  @override
  void initState() {
    super.initState();
    final mostViewedModel =
        Provider.of<MostViewedClass>(context, listen: false);
    mostViewedModel.getMostViewedPlace();
  }

  @override
  Widget build(BuildContext context) {
    final mostViewed = Provider.of<MostViewedClass>(context);
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
                placeModel: mostViewed.mostView?[index],
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
                SizedBox(
                  height: 100,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: mostViewed.mostView?[index].gallery == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Image.network(
                            mostViewed.mostView![index].gallery[0],
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                MarginHeight(height: 8),
                Text(
                  mostViewed.mostView?[index].name ?? 'Loading...',
                  style: regularText.copyWith(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: greyColor,
                      size: 15,
                    ),
                    MarginWidth(width: 5),
                    Expanded(
                      child: Text(
                        mostViewed.mostView?[index].province ?? 'Loading',
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
