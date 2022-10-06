import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/screens/home/favorite/fav_list.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);
  FavoriteModel? favModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: blackBackgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
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
                Text('Here are your favorite destinations ❤️',
                    style: subTitleText),
                MarginHeight(height: 20),
                FavList()
              ],
            ),
          ),
        )),
      ),
    );
  }
}
