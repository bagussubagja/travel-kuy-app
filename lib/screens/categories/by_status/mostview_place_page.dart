import 'package:animated_image_list/AnimatedImageList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/statues_place_notifier.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class MostViewPlacePage extends StatefulWidget {
  PlaceModel? placeModel;
  MostViewPlacePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MostViewPlacePage> createState() => _MostViewPlacePageState();
}

class _MostViewPlacePageState extends State<MostViewPlacePage> {
  @override
  void initState() {
    super.initState();
    final mostViewModel = Provider.of<MostViewedClass>(context, listen: false);
    mostViewModel.getMostViewedPlace();
  }

  @override
  Widget build(BuildContext context) {
    final mostViewModel = Provider.of<MostViewedClass>(context);
    // List<String> list = [recommendedModel.recommended![index!].gallery[index!]];
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: blackBackgroundColor,
        title: Text('Most Viewed Places'),
      ),
      body: Center(
        child: AnimatedImageList(
          images: mostViewModel.mostView!.map((e) => e.gallery[0]).toList(),
          builder: (context, index, progress) {
            final item = mostViewModel.mostView![index];
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
                          mostViewModel.mostView![index].name,
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
