import 'package:animated_image_list/AnimatedImageList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/recommended_notifier.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';


class RecommendedPlacePage extends StatefulWidget {
  PlaceModel? placeModel;
  RecommendedPlacePage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendedPlacePage> createState() => _RecommendedPlacePageState();
}

class _RecommendedPlacePageState extends State<RecommendedPlacePage> {


  @override
  void initState() {
    super.initState();
    final recommendedModel =
        Provider.of<RecommendedClass>(context, listen: false);
    recommendedModel.getRecommendedPlace();
  }

  @override
  Widget build(BuildContext context) {
    final recommendedModel = Provider.of<RecommendedClass>(context);
    // List<String> list = [recommendedModel.recommended![index!].gallery[index!]];
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: blackBackgroundColor,
        title: Text('Recommended Places'),
      ),
      body: Center(
        child: AnimatedImageList(
          images:
              recommendedModel.recommended!.map((e) => e.gallery[0]).toList(),
          builder: (context, index, progress) {
            final item = recommendedModel.recommended![index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    placeModel: item,
                  );
                }));
              },
              child: Positioned.directional(
                  textDirection: TextDirection.ltr,
                  child: Opacity(
                    opacity: progress > 1 ? (2 - progress) : progress,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          recommendedModel.recommended![index].name,
                          style: titleText,
                        ),
                      ),
                    ),
                  )),
            );
          },
          scrollDirection: Axis.vertical,
          itemExtent: 150,
          maxExtent: 400,
        ),
      ),
    );
  }
}
