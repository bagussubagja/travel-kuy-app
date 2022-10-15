// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class GalleryPhoto extends StatelessWidget {
  GalleryPhoto({Key? key, this.placeModel, this.favModel}) : super(key: key);
  PlaceModel? placeModel;
  FavoriteModel? favModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => MarginWidth(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: placeModel?.gallery.length ?? 5,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(placeModel?.gallery[index] ?? favModel!.tourismPlace!.gallery![index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
