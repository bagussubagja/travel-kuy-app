import 'package:flutter/material.dart';
import 'package:travel_kuy_app/screens/home/favorite/fav_list.dart';
import 'package:travel_kuy_app/screens/home/favorite/fav_not_found.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite',
              style: titleText,
            ),
            MarginHeight(height: 5),
            Text('Here are your favorite destinations ❤️', style: subTitleText),
            MarginHeight(height: 40),
            // FavNotFound()
            FavList()
          ],
        ),
      )),
    );
  }
}
