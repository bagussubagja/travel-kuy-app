import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/newlyadded_notifier.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

class NewlyAddedCard extends StatefulWidget {
  const NewlyAddedCard({Key? key}) : super(key: key);

  @override
  State<NewlyAddedCard> createState() => _NewlyAddedCardState();
}

class _NewlyAddedCardState extends State<NewlyAddedCard> {
  @override
  void initState() {
    super.initState();
    final newlyAddedModel =
        Provider.of<NewlyAddedClass>(context, listen: false);
    newlyAddedModel.getNewlyAddedPlace();
  }

  @override
  Widget build(BuildContext context) {
    final newlyAddedModel = Provider.of<NewlyAddedClass>(context);
    return SizedBox(
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => MarginHeight(height: 10),
        itemBuilder: (context, index) => Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.3)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: newlyAddedModel.newly?[index].gallery == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Image.network(
                            newlyAddedModel.newly![index].gallery[0],
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                MarginWidth(width: 10),
                SizedBox(
                  height: 100,
                  width: 175,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newlyAddedModel.newly?[index].name ?? 'Loading...',
                        style: regularText.copyWith(fontSize: 14),
                      ),
                      MarginHeight(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: greyColor,
                            size: 12,
                          ),
                          MarginWidth(width: 5),
                          Text(
                            newlyAddedModel.newly?[index].province ??
                                'Loading...',
                            style: subTitleText.copyWith(
                                color: greyColor, fontSize: 13),
                          ),
                        ],
                      ),
                      MarginHeight(height: 3),
                      Text(
                        '${rupiah(newlyAddedModel.newly?[index].price ?? 0)}/person',
                        style: subTitleText.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
