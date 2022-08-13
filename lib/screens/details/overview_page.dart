import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_kuy_app/screens/details/widgets/gallery_photo.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: titleText,
          ),
          MarginHeight(height: 5),
          ReadMoreText(
            'Bali Safari, the African Safari Adventure in Bali, is home to over a thousand amazing animals - Bali Safari Park is your destination for an adventurous, fun, educational experience more than just a safari. Our park is representing more than 120 species, including rare & endangered species - the Komodo Dragon, Orangutan, and the Bali Starling bird. Bali Safari Park is at the frontline of wildlife conservation in Indonesia. We are actively involved in ensuring the future survival and well-being of many Indonesian animal species.',
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
          GalleryPhoto(),
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
                  'Jl. Prof. Dr. Ida Bagus Mantra No.km 19, Serongga, Kec. Gianyar, Kabupaten Gianyar, Bali',
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
