import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class FavList extends StatefulWidget {
  FavList({Key? key}) : super(key: key);

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
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

  bool isFavorite = false;

  void _myFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        itemCount: imgUrl.length,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 40),
        itemBuilder: (context, index) => Container(
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
                      child: Image.asset(
                        imgUrl[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 38,
                      width: 38,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isFavorite ? blackBackgroundColor.withOpacity(0.3) : Colors.pink.withOpacity(0.3)),
                      child: GestureDetector(
                        onTap: () {},
                        child: IconButton(
                            onPressed: () {
                              _myFavorite();
                            },
                            icon: isFavorite
                                ? const Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.pink,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  )),
                      ),
                    ),
                  )
                ],
              ),
              MarginHeight(height: 8),
              Text(
                'Pantai Pangandaran',
                style: regularText.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
