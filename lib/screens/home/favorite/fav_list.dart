// ignore_for_file: prefer_is_empty, must_be_immutable

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/fav_notifier/favorite_notifier.dart';
import 'package:travel_kuy_app/screens/categories/by_status/recommended_place_page.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';

import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class FavList extends StatefulWidget {
  String? idUser;
  FavList({Key? key}) : super(key: key);

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<FavoritePlaceClass>(context, listen: false);
    ReadCache.getString(key: "cache").then((value) {
      setState(() {
        widget.idUser = value;
      });
    });
    favorite.getUserData(idUser: widget.idUser ?? "", context: context);

    if (favorite.fav?.length == 0) {
      return contentNotFound();
    }
    return GridView.builder(
        itemCount: favorite.fav?.length ?? 0,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 40),
        itemBuilder: (context, index) {
          // final favItem = favList[index];
          final favItem = favorite.fav![index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(
                  favModel: favItem,
                );
              }));
            },
            child: Container(
              height: 10,
              width: 175,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: favorite.fav?[0].tourismPlace?.gallery == null
                              ? const CircularProgressIndicator()
                              : Image.network(
                                  favorite.fav![index].tourismPlace!.gallery![0],
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ],
                  ),
                  MarginHeight(height: 8),
                  Text(
                    favorite.fav?[index].tourismPlace?.name ?? "Loading...",
                    style: regularText.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget contentNotFound() {
    return Center(
      child: Column(
        children: [
          MarginHeight(height: 75),
          LottieBuilder.asset('assets/lottie/not-found.json'),
          Text(
            'No Favorite Place found!',
            style: regularText,
          ),
          MarginHeight(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Try to explore the beauty place',
                style: subTitleText,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RecommendedPlacePage();
                  }));
                },
                child: Text(
                  ' Here!',
                  style: subTitleText.copyWith(color: whiteColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
