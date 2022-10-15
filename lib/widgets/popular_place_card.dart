import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/statues_place_notifier.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class PopularPlaceCard extends StatefulWidget {
  const PopularPlaceCard({Key? key}) : super(key: key);

  @override
  State<PopularPlaceCard> createState() => _PopularPlaceCardState();
}

class _PopularPlaceCardState extends State<PopularPlaceCard> {
  @override
  void initState() {
    super.initState();
    final popularModel = Provider.of<PopularClass>(context, listen: false);
    popularModel.getPopularPlace();
  }

  @override
  Widget build(BuildContext context) {
    final popularModel = Provider.of<PopularClass>(context);
    return SizedBox(
      height: 175,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return MarginWidth(width: 10);
          },
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = popularModel.popular?[index];
            return Container(
              width: 275,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: item?.gallery[0] == null
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Image.network(
                                  item!.gallery[0],
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                      MarginWidth(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item?.name ?? "Loading...",
                              style: regularText,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_rounded,
                                    color: greyColor, size: 15),
                                MarginWidth(width: 5),
                                Expanded(
                                  child: Text(
                                    item?.district ?? "Loading",
                                    style: subTitleText,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${rupiah(item?.price ?? 0)}/person',
                              style: subTitleText,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                              placeModel: item,
                            );
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.25),
                        ),
                        child: Text(
                          'View Detail',
                          style: regularText,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
