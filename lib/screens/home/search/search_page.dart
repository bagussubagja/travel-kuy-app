import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/home/search/search_logic.dart';
import 'package:travel_kuy_app/services/tourism_place_service/get_all_place_service.dart';
import 'package:travel_kuy_app/shared/theme.dart';

import '../../../widgets/margin_widget_height.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GetPlaces _getPlaces = GetPlaces();
  // @override
  // void initState() {
  //   GetPlaces().getPlacesList();
  //   // TODO: implement initState
  //   super.initState();
  // }

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
              'Search',
              style: titleText,
            ),
            MarginHeight(height: 5),
            Text("Here's to find so many beatiful places 🔍",
                style: subTitleText),
            MarginHeight(height: 50),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: LottieBuilder.asset('assets/lottie/search-page.json'),
            ),
            Center(
              child: Column(
                children: [
                  MarginHeight(height: 20),
                  Text(
                    'Ready to find the beauty of Indonesia?',
                    style: regularText,
                    textAlign: TextAlign.center,
                  ),
                  MarginHeight(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greenDarkerColor,
                      ),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchPlace(),
                        );
                      },
                      child: Text(
                        "Let's Find Out!",
                        style: regularText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
