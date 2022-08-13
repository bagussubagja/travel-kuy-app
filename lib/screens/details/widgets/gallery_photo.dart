import 'package:flutter/material.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class GalleryPhoto extends StatelessWidget {
  GalleryPhoto({Key? key}) : super(key: key);
  List<String> imgUrl = [
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/mountain.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => MarginWidth(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: imgUrl.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgUrl[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
