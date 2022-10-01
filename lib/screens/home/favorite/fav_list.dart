import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/fav_notifier/favorite_notifier.dart';
import 'package:travel_kuy_app/core/fav_notifier/favorite_notifier.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/content_not_found.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class FavList extends StatefulWidget {
  FavList({Key? key}) : super(key: key);

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {


  @override
  void initState() {
    // TODO: implement initStata
    super.initState();
    final favorite = Provider.of<FavoritePlaceClass>(context, listen: false);
    ReadCache.getString(key: "cache")
        .then((value) => favorite.getUserData(idUser: value));
  }

  @override
  Widget build(BuildContext context) {
    // final fav = Provider.of<FavoriteNotifier>(context);
    // final favList = fav.placeModel;
    final favorite = Provider.of<FavoritePlaceClass>(context);

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
                          child: favorite.fav?[0].gallery![0] == null
                              ? CircularProgressIndicator()
                              : Image.network(
                                  favorite.fav![index].gallery![0],
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ],
                  ),
                  MarginHeight(height: 8),
                  Text(
                    favorite.fav?[index].name ?? "Loading...",
                    style: regularText.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
