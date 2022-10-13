import 'package:flutter/material.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';

import '../../../models/place_model.dart';
import '../../../services/tourism_place_service/get_all_place_service.dart';

class SearchPlace extends SearchDelegate {
  final GetPlaces _getPlaces = GetPlaces();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        primaryColor: greenDarkerColor,
        hintColor: greyColor,
        appBarTheme: AppBarTheme(backgroundColor: blackBackgroundColor),
        inputDecorationTheme: searchFieldDecorationTheme,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(color: whiteColor),
            ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
          child: SizedBox(
        child: FutureBuilder<List<PlaceModel>>(
            future: _getPlaces.getPlacesList(query: query),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: blackBackgroundColor,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                              placeModel: data![index],
                            );
                          }));
                        },
                        title: Text(
                          data![index].name,
                          style: regularText,
                        ),
                      ),
                    );
                  });
            }),
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: Center(
        child: Text(
          "Try 'Pantai Kuta'",
          style: regularText,
        ),
      ),
    );
  }
}
