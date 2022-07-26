import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/statues_place_notifier.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class RecommendedPlaceCard extends StatefulWidget {
  const RecommendedPlaceCard({Key? key}) : super(key: key);

  @override
  State<RecommendedPlaceCard> createState() => _RecommendedPlaceCardState();
}

class _RecommendedPlaceCardState extends State<RecommendedPlaceCard> {
  @override
  void initState() {
    super.initState();
    final recommendedModel =
        Provider.of<RecommendedClass>(context, listen: false);
    recommendedModel.getRecommendedPlace();
  }

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final recommendedModel = Provider.of<RecommendedClass>(context);
    return SizedBox(
      height: 250,
      child: ListView.separated(
        separatorBuilder: (context, index) => MarginWidth(width: 15),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = recommendedModel.recommended?[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(placeModel: item,);
              }));
            },
            child: SizedBox(
              height: 250,
              width: 200,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: recommendedModel.recommended?[index].gallery ==
                              null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Image.network(
                              recommendedModel.recommended![index].gallery[0],
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: blackBackgroundColor.withOpacity(0.6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recommendedModel.recommended?[index].name ??
                                      'Loading...',
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
                                        recommendedModel
                                                .recommended?[index].province ??
                                            'Loading...',
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
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
