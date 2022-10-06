import 'package:animated_image_list/AnimatedImageList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/statues_place_notifier.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class PopularPlacePage extends StatefulWidget {
  PlaceModel? placeModel;
  PopularPlacePage({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularPlacePage> createState() => _PopularPlacePageState();
}

class _PopularPlacePageState extends State<PopularPlacePage> {
  @override
  void initState() {
    super.initState();
    final popularModel = Provider.of<PopularClass>(context, listen: false);
    popularModel.getPopularPlace();
  }

  @override
  Widget build(BuildContext context) {
    final popularModel = Provider.of<PopularClass>(context);
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: blackBackgroundColor,
        title: Text('Popular Places'),
      ),
      body: Center(
        child: AnimatedImageList(
          images: popularModel.popular!.map((e) => e.gallery[0]).toList(),
          builder: (context, index, progress) {
            final item = popularModel.popular![index];
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
                          popularModel.popular![index].name,
                          style: titleText,
                          textAlign: TextAlign.center,
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
