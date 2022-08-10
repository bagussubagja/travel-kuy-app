import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../shared/theme.dart';
import '../../widgets/margin_widget_height.dart';
import '../../widgets/margin_widget_width.dart';
import '../../widgets/recommended_card.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        MarginHeight(height: 10),
        Text('Description', style: titleText),
        MarginHeight(height: 5),
        ReadMoreText(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate tempor felis vel ullamcorper. Etiam condimentum ultrices tempus. Duis quis est eget nunc rutrum volutpat at sed nisl. Quisque non dui ac augue lobortis porttitor. Vivamus eget finibus quam, vel porttitor ligula. ',
          trimLines: 4,
          style: regularText.copyWith(
            color: greyColor,
          ),
          colorClickableText: greenDarkerColor,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: ' Show less',
        ),
        MarginHeight(height: 10),
        Text('Gallery', style: titleText),
        MarginHeight(height: 10),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => MarginWidth(width: 10),
            itemBuilder: (context, index) => Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/lake.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        MarginHeight(height: 10),
        Text('Address', style: titleText),
        MarginHeight(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.location_on_rounded, color: greenDarkerColor, size: 25),
            MarginWidth(width: 15),
            Expanded(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                style: regularText.copyWith(
                  color: greyColor,
                ),
              ),
            ),
          ],
        ),
        MarginHeight(height: 10),
        Text('Opening Hour', style: titleText),
        MarginHeight(height: 5),
        Text('08.00 - 16.00 WIB',
            style: regularText.copyWith(color: greyColor)),
      ],
    );
  }
}
