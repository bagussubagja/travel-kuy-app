import 'dart:ui';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indonesia/indonesia.dart';
import 'package:provider/provider.dart';
import 'package:switch_tab/switch_tab.dart';
import 'package:travel_kuy_app/core/fav_notifier/favorite_notifier.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/screens/details/overview_page.dart';
import 'package:travel_kuy_app/screens/details/review_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/custom_nav_button.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

import '../../widgets/my_textfield.dart';

class DetailScreen extends StatefulWidget {
  PlaceModel? placeModel;
  DetailScreen({Key? key, this.placeModel}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int indexPage = 0;
  bool isFavorite = false;
  int person = 0;
  int price = 1500000;
  int totalPrice = 0;
  DateTime _selectedDate = DateTime(2022, 08, 17);

  @override
  void initState() {
    super.initState();
    totalPrice = totalPrice + widget.placeModel!.price;
  }

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteNotifier>(context);
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: widget.placeModel?.gallery == null
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Image.network(
                                widget.placeModel!.gallery[0],
                                fit: BoxFit.cover,
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomNavButton(
                            bgColor: Colors.black.withOpacity(0.5),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back, color: whiteColor),
                            ),
                          ),
                          CustomNavButton(
                            bgColor: isFavorite
                                ? Colors.pink.withOpacity(0.5)
                                : Colors.black.withOpacity(0.5),
                            child: IconButton(
                                onPressed: () {
                                  // setState(() => isFavorite = !isFavorite);
                                  fav.toggleFavorite(widget.placeModel!);
                                },
                                icon: fav.isExist(widget.placeModel!)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
                                      )
                                    : Icon(
                                        Icons.favorite_border_rounded,
                                        color: whiteColor,
                                      )),
                          )
                        ],
                      ),
                      Positioned(
                        top: 240,
                        left: 20,
                        right: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 135,
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.placeModel?.name ?? 'Loading...',
                                      style: titleText.copyWith(fontSize: 18)),
                                  MarginHeight(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: greyColor,
                                        size: 17,
                                      ),
                                      MarginWidth(width: 5),
                                      Expanded(
                                        child: Text(
                                            '${widget.placeModel?.district}, ${widget.placeModel?.province}',
                                            style: subTitleText.copyWith(
                                                fontSize: 14)),
                                      ),
                                    ],
                                  ),
                                  MarginHeight(height: 5),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: double.parse(
                                            widget.placeModel!.rating),
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 17.5,
                                        direction: Axis.horizontal,
                                      ),
                                      MarginWidth(width: 5),
                                      Text(widget.placeModel?.rating ?? '4.0',
                                          style: subTitleText.copyWith(
                                              fontSize: 14)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MarginHeight(height: 90),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SwitchTab(
                      backgroundColour: Colors.black.withOpacity(0.25),
                      text: const ["Overview", "Reviews"],
                      selectedTextColor: whiteColor,
                      unselectedTextColor: greyColor,
                      shape: SwitchTabShape.rounded,
                      thumbColor: greenDarkerColor,
                      onValueChanged: (index) {
                        setState(() {
                          indexPage = index;
                        });
                      },
                    ),
                  ),
                  indexPage == 0
                      ? OverviewPage(
                          placeModel: widget.placeModel,
                        )
                      : ReviewPage(placeModel: widget.placeModel),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.black87,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Column(
                        children: [
                          Text(
                            rupiah(widget.placeModel!.price),
                            style: regularText,
                          ),
                          Text(
                            '/person',
                            style: regularText,
                          ),
                        ],
                      ),
                    ),
                    MarginWidth(width: 20),
                    Expanded(
                        child: SizedBox(
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                        color: blackBackgroundColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: defaultPadding,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MarginHeight(height: 10),
                                            Center(
                                              child: Container(
                                                height: 5,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: greyColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            MarginHeight(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 65,
                                                      width: 65,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Image.network(
                                                          widget.placeModel!
                                                              .gallery[0],
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    MarginWidth(width: 15),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          widget.placeModel
                                                                  ?.name ??
                                                              'Loading...',
                                                          style: regularText,
                                                        ),
                                                        Text(
                                                          '${rupiah(widget.placeModel?.price ?? 0)}/person',
                                                          style: subTitleText,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            MarginHeight(height: 15),
                                            Text(
                                              'You will book a vacation to ${widget.placeModel!.name}. Before you set your plans, let us know when you will be leaving and how many people will be traveling with you!',
                                              style: regularText.copyWith(
                                                  color: greyColor,
                                                  fontSize: 16),
                                            ),
                                            // MarginHeight(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: MyTextField(
                                                    readOnly: true,
                                                    prefixIcon: Icon(
                                                      Icons
                                                          .calendar_month_rounded,
                                                      color: greyColor,
                                                    ),
                                                    onTap: () async {
                                                      DateTime? pickedDate =
                                                          await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  _selectedDate,
                                                              firstDate:
                                                                  DateTime(
                                                                      2022),
                                                              lastDate:
                                                                  DateTime(
                                                                      2100));
                                                      // if user cancel the date picker
                                                      if (pickedDate == null) {
                                                        return null;
                                                      }
                                                      // if user select new date
                                                      setState(() =>
                                                          _selectedDate =
                                                              pickedDate);
                                                    },
                                                    hintText: _selectedDate
                                                        .toString()
                                                        .substring(0, 10),
                                                  ),
                                                ),
                                                MarginWidth(width: 15),
                                              ],
                                            ),
                                            MarginHeight(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Price : ${totalPrice == 0 ? rupiah(widget.placeModel!.price) : rupiah(totalPrice)}',
                                                  style: regularText,
                                                ),
                                                CountStepper(
                                                  iconColor: greenLightColor,
                                                  textStyle: regularText,
                                                  iconIncrementColor:
                                                      greenLightColor,
                                                  defaultValue: 1,
                                                  max: 100,
                                                  min: 1,
                                                  iconDecrementColor:
                                                      greenLightColor,
                                                  splashRadius: 50,
                                                  onPressed: (value) {
                                                    setState(() => totalPrice =
                                                        widget.placeModel!
                                                                .price *
                                                            value);
                                                  },
                                                ),
                                              ],
                                            ),
                                            MarginHeight(height: 15),
                                            SizedBox(
                                              height: 50,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: greenDarkerColor),
                                                onPressed: () {
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          AppRoutes
                                                              .bookingProcess,
                                                          (route) => false);
                                                },
                                                child: Text(
                                                  'Confirm',
                                                  style: regularText,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              );
                            },
                          );
                        },
                        style:
                            ElevatedButton.styleFrom(primary: greenDarkerColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Now',
                              style: regularText,
                            ),
                            MarginWidth(width: 10),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
