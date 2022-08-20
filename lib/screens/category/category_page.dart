import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/category_card.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

import '../../widgets/custom_nav_button.dart';
import '../../widgets/margin_widget_width.dart';
import 'category_class.dart';

class CategoryPage extends StatelessWidget {
  CategoryClass? cc;
  CategoryPage({Key? key, this.cc}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackBackgroundColor,
        body: Scrollbar(
          controller: _scrollController,
          child: Expanded(
            child: CustomScrollView(
              primary: false,
              slivers: [
                SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: cc?.index == 0
                        ? Image.asset('assets/images/beach.jpg', fit: BoxFit.fill,)
                        : cc?.index == 1
                            ? Image.asset('assets/images/island.jpg', fit: BoxFit.fill,)
                            : cc?.index == 2
                                ? Image.asset('assets/images/lake.png', fit: BoxFit.fill,)
                                : cc?.index == 3
                                    ? Image.asset('assets/images/mountain.jpg', fit: BoxFit.fill,)
                                    : cc?.index == 4
                                        ? Image.asset('assets/images/park.png', fit: BoxFit.fill,)
                                        : cc?.index == 5
                                            ? Image.asset(
                                                'assets/images/waterfall.jpg', fit: BoxFit.fill,)
                                            : Image.asset(
                                                'assets/images/beach.jpg', fit: BoxFit.fill,),
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
                        icon:
                            Icon(Icons.arrow_back, color: blackBackgroundColor),
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
                          cc?.index == 0
                              ? "Beach"
                              : cc?.index == 1
                                  ? "Island"
                                  : cc?.index == 2
                                      ? "Lake"
                                      : cc?.index == 3
                                          ? "Mountain"
                                          : cc?.index == 4
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
                          height: MediaQuery.of(context).size.height * 4,
                          child: GridView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: 30,
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
                                      child: Image.asset(
                                        cc?.index == 0
                                            ? "assets/images/beach.jpg"
                                            : cc?.index == 1
                                                ? "assets/images/island.jpg"
                                                : cc?.index == 2
                                                    ? "assets/images/lake.png"
                                                    : cc?.index == 3
                                                        ? "assets/images/mountain.jpg"
                                                        : cc?.index == 4
                                                            ? "assets/images/park.png"
                                                            : "assets/images/waterfall.jpg",
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
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                            color: blackBackgroundColor
                                                .withOpacity(0.6),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Rinjani Mountain',
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
                                                    style:
                                                        subTitleText.copyWith(
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
          ),
        ));
  }
}
