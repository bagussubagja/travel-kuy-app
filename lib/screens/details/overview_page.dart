// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/details/widgets/gallery_photo.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';
import 'package:map_launcher/map_launcher.dart';

class OverviewPage extends StatefulWidget {
  OverviewPage({Key? key, this.placeModel, this.favModel}) : super(key: key);
  PlaceModel? placeModel;
  FavoriteModel? favModel;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  List<String>? coordinateSplittedPlaceModel;
  List<String>? coordinateSplittedFavoriteModel;
  String? lang, longitude;
  
  @override
  void initState() {
    super.initState();
    coordinateSplittedPlaceModel = widget.placeModel?.coordinate.split(' ');
    coordinateSplittedFavoriteModel = widget.favModel?.tourismPlace?.coordinate?.split(' ');
    lang = coordinateSplittedPlaceModel?[0].replaceAll(",", "") ?? coordinateSplittedFavoriteModel?[0].replaceAll(",", "");
    longitude = coordinateSplittedPlaceModel?[1].replaceAll(",", "") ?? coordinateSplittedFavoriteModel?[1].replaceAll(",", "");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: detailPagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: titleText,
          ),
          MarginHeight(height: 5),
          ReadMoreText(
            widget.placeModel?.description == null
                ? widget.favModel!.tourismPlace!.description!
                : widget.placeModel!.description,
            trimLines: 3,
            style: regularText.copyWith(color: greyColor),
            colorClickableText: greenDarkerColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: ' Show less',
          ),
          MarginHeight(height: 10),
          Text(
            'Gallery',
            style: titleText,
          ),
          MarginHeight(height: 10),
          GalleryPhoto(
              placeModel: widget.placeModel, favModel: widget.favModel),
          MarginHeight(height: 10),
          Text(
            'Address',
            style: titleText,
          ),
          MarginHeight(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on, color: greenDarkerColor),
              MarginWidth(width: 5),
              Flexible(
                child: Text(
                  widget.placeModel?.address ?? widget.favModel!.tourismPlace!.address!,
                  style: regularText.copyWith(color: greyColor),
                ),
              ),
            ],
          ),
          MarginHeight(height: 10),
          Center(
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: greenDarkerColor),
                onPressed: () async {
                  final availableMaps = await MapLauncher.installedMaps;
                  await availableMaps.first.showMarker(
                    description: widget.placeModel?.description ??
                        widget.favModel?.tourismPlace?.description!,
                    coords:
                        Coords(double.parse(lang!), double.parse(longitude!)),
                    title: widget.placeModel?.name ?? widget.favModel!.tourismPlace!.name!,
                  );
                },
                child: Text(
                  "Show on Google Maps",
                  style: regularText,
                )),
          ),
        ],
      ),
    );
  }
}
