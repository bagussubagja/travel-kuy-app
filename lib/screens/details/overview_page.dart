import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/details/widgets/gallery_photo.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class OverviewPage extends StatelessWidget {
  OverviewPage({Key? key, this.placeModel, this.favModel}) : super(key: key);
  PlaceModel? placeModel;
  FavoriteModel? favModel;

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
            placeModel?.description == null
                ? favModel!.description!
                : placeModel!.description,
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
          GalleryPhoto(placeModel: placeModel, favModel: favModel),
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
                  placeModel?.address ?? favModel!.address!,
                  style: regularText.copyWith(color: greyColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
