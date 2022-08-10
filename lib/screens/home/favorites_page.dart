import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';

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
          children: [
            Text(
              'Favorite',
              style: titleText,
            )
          ],
        ),
      )),
    );
  }
}
