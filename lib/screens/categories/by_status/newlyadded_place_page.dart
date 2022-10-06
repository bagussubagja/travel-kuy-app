import 'package:animated_image_list/AnimatedImageList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/statues_place_notifier.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class NewlyAddedPlacePage extends StatefulWidget {
  PlaceModel? placeModel;
  NewlyAddedPlacePage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewlyAddedPlacePage> createState() => _NewlyAddedPlacePageState();
}

class _NewlyAddedPlacePageState extends State<NewlyAddedPlacePage> {
  @override
  void initState() {
    super.initState();
    final newlyaddedModel = Provider.of<NewlyAddedClass>(context, listen: false);
    newlyaddedModel.getNewlyAddedPlace();
  }

  @override
  Widget build(BuildContext context) {
     final newlyaddedModel = Provider.of<NewlyAddedClass>(context);
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: blackBackgroundColor,
        title: Text('Newly Added Places'),
      ),
      body: Center(
        child: AnimatedImageList(
          images: newlyaddedModel.newly!.map((e) => e.gallery[0]).toList(),
          builder: (context, index, progress) {
            final item = newlyaddedModel.newly![index];
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
                          newlyaddedModel.newly![index].name,
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
