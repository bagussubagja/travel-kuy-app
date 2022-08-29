// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/place_notifier/category_notifier.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import '../../widgets/margin_widget_width.dart';
import 'category_class.dart';

class CategoryPage extends StatefulWidget {
  CategoryClass? cc;
  CategoryPage({Key? key, this.cc}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final beachModel = Provider.of<BeachClass>(context, listen: false);
    beachModel.getCatagoryPlaces();
    final islandModel = Provider.of<IslandClass>(context, listen: false);
    islandModel.getCatagoryPlaces();
    final lakeModel = Provider.of<LakeClass>(context, listen: false);
    lakeModel.getCatagoryPlaces();
    final mountainModel = Provider.of<MountainClass>(context, listen: false);
    mountainModel.getCatagoryPlaces();
    final parkModel = Provider.of<ParkClass>(context, listen: false);
    parkModel.getCatagoryPlaces();
    final waterfallModel = Provider.of<WaterfallClass>(context, listen: false);
    waterfallModel.getCatagoryPlaces();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.cc?.index);
    final beachModel = Provider.of<BeachClass>(context);
    final islandModel = Provider.of<IslandClass>(context);
    final lakeModel = Provider.of<LakeClass>(context);
    final mountainModel = Provider.of<MountainClass>(context);
    final parkModel = Provider.of<ParkClass>(context);
    final waterfallModel = Provider.of<WaterfallClass>(context);
    return Scaffold(
        backgroundColor: blackBackgroundColor,
        body: Scrollbar(
          controller: _scrollController,
          child: CustomScrollView(
            primary: false,
            slivers: [
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: widget.cc?.index == 0
                      ? Image.asset(
                          'assets/images/beach.jpg',
                          fit: BoxFit.fill,
                        )
                      : widget.cc?.index == 1
                          ? Image.asset(
                              'assets/images/island.jpg',
                              fit: BoxFit.fill,
                            )
                          : widget.cc?.index == 2
                              ? Image.asset(
                                  'assets/images/lake.png',
                                  fit: BoxFit.fill,
                                )
                              : widget.cc?.index == 3
                                  ? Image.asset(
                                      'assets/images/mountain.jpg',
                                      fit: BoxFit.fill,
                                    )
                                  : widget.cc?.index == 4
                                      ? Image.asset(
                                          'assets/images/park.png',
                                          fit: BoxFit.fill,
                                        )
                                      : widget.cc?.index == 5
                                          ? Image.asset(
                                              'assets/images/waterfall.jpg',
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              'assets/images/beach.jpg',
                                              fit: BoxFit.fill,
                                            ),
                ),
                backgroundColor: blackBackgroundColor,
                expandedHeight: 250,
                leading: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withAlpha(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: blackBackgroundColor),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MarginHeight(height: 15),
                      Text(
                        widget.cc?.index == 0
                            ? "Beach"
                            : widget.cc?.index == 1
                                ? "Island"
                                : widget.cc?.index == 2
                                    ? "Lake"
                                    : widget.cc?.index == 3
                                        ? "Mountain"
                                        : widget.cc?.index == 4
                                            ? "Park"
                                            : "Waterfall",
                        style: titleText,
                      ),
                      MarginHeight(height: 5),
                      Text(
                        '"There is a feeling of satisfaction every time you walk on wet sand, feel the ocean breeze on your face."',
                        style: subTitleText,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 3.9,
                        child: GridView.builder(
                          shrinkWrap: true,
                          controller: _scrollController,
                          itemCount: widget.cc?.index == 0
                              ? beachModel.beach?.length
                              : widget.cc?.index == 1
                                  ? islandModel.island?.length
                                  : widget.cc?.index == 2
                                      ? islandModel.island?.length
                                      : widget.cc?.index == 3
                                          ? mountainModel.mountain?.length
                                          : widget.cc?.index == 4
                                              ? parkModel.park?.length
                                              : waterfallModel
                                                  .waterfall?.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 20),
                          itemBuilder: (context, index) => SizedBox(
                            height: 240,
                            width: 195,
                            child: Stack(
                              children: [
                                Container(
                                  height: 240,
                                  width: 195,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: beachModel.beach?[index].gallery ==
                                            null
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Image.network(
                                            widget.cc?.index == 0
                                                ? beachModel
                                                    .beach![index].gallery[0]
                                                : widget.cc?.index == 1
                                                    ? islandModel.island![index]
                                                        .gallery[0]
                                                    : widget.cc?.index == 2
                                                        ? islandModel
                                                            .island![index]
                                                            .gallery[0]
                                                        : widget.cc?.index == 3
                                                            ? mountainModel
                                                                .mountain![
                                                                    index]
                                                                .gallery[0]
                                                            : widget.cc?.index ==
                                                                    4
                                                                ? parkModel
                                                                    .park![
                                                                        index]
                                                                    .gallery[0]
                                                                : waterfallModel
                                                                    .waterfall![
                                                                        index]
                                                                    .gallery[0],
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 2, sigmaY: 2),
                                      child: Container(
                                        width: double.infinity,
                                        height: 55,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          color: blackBackgroundColor
                                              .withOpacity(0.6),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            beachModel.beach?[index].name ==
                                                    null
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : Text(
                                                    widget.cc?.index == 0
                                                        ? beachModel
                                                            .beach![index].name
                                                        : widget.cc?.index == 1
                                                            ? islandModel
                                                                .island![index]
                                                                .name
                                                            : widget.cc?.index ==
                                                                    2
                                                                ? islandModel
                                                                    .island![
                                                                        index]
                                                                    .name
                                                                : widget.cc?.index ==
                                                                        3
                                                                    ? mountainModel
                                                                        .mountain![
                                                                            index]
                                                                        .name
                                                                    : widget.cc?.index ==
                                                                            4
                                                                        ? parkModel
                                                                            .park![
                                                                                index]
                                                                            .name
                                                                        : waterfallModel
                                                                            .waterfall![index]
                                                                            .name,
                                                    style: regularText.copyWith(
                                                        fontSize: 14),
                                                  ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_on_rounded,
                                                  color: greyColor,
                                                  size: 15,
                                                ),
                                                MarginWidth(width: 5),
                                                Text(
                                                  'Jawa Barat',
                                                  style: subTitleText.copyWith(
                                                      color: greyColor,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
