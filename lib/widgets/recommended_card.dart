// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

import 'margin_widget_width.dart';

class RecommendedCard extends StatelessWidget {
   RecommendedCard({Key? key}) : super(key: key);
  List<String> imgUrl = [
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/mountain.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/mountain.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: imgUrl.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => MarginWidth(width: 10),
        itemBuilder: (context, index) => Container(
          height: 200,
          width: 185,
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 110,
                  width: double.infinity,
                  child: Image.asset(
                    imgUrl[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              MarginHeight(height: 8),
              Text(
                'Pantai Pangandaran',
                style: regularText.copyWith(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: greyColor,
                    size: 15,
                  ),
                  MarginWidth(width: 5),
                  Text(
                    'Jawa Barat',
                    style:
                        subTitleText.copyWith(color: greyColor, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
