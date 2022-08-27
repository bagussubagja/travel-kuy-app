import 'dart:ui';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indonesia/indonesia.dart';
import 'package:switch_tab/switch_tab.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/screens/details/overview_page.dart';
import 'package:travel_kuy_app/screens/details/review_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/custom_nav_button.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

import '../../widgets/my_textfield.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

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
    totalPrice = totalPrice + price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Image.asset(
                          'assets/images/beach.jpg',
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
                                ? Colors.black.withOpacity(0.5)
                                : Colors.pink.withOpacity(0.5),
                            child: IconButton(
                                onPressed: () {
                                  setState(() => isFavorite = !isFavorite);
                                },
                                icon: isFavorite
                                    ? Icon(
                                        Icons.favorite_border_rounded,
                                        color: whiteColor,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
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
                              height: 125,
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Gunung Rinjani', style: titleText),
                                  MarginHeight(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: greyColor,
                                        size: 20,
                                      ),
                                      MarginWidth(width: 5),
                                      Text('Banyuwangi, Jawa Timur',
                                          style: subTitleText),
                                    ],
                                  ),
                                  MarginHeight(height: 5),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: 4.6,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                      MarginWidth(width: 5),
                                      Text('4.6', style: subTitleText),
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
                  MarginHeight(height: 75),
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
                  indexPage == 0 ? const OverviewPage() : ReviewPage(),
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
                            rupiah(1500000),
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
                            isDismissible: false,
                            enableDrag: false,
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
                                            MarginHeight(height: 15),
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
                                                        child: Image.asset(
                                                          'assets/images/beach.jpg',
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
                                                          'Gunung Rinjani',
                                                          style: regularText,
                                                        ),
                                                        Text(
                                                          '${rupiah(1500000)}/person',
                                                          style: subTitleText,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                OutlinedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                            side: BorderSide(
                                                                color:
                                                                    greyColor,
                                                                width: 1)),
                                                    child: Text(
                                                      'Cancel',
                                                      style: subTitleText,
                                                    ))
                                              ],
                                            ),
                                            MarginHeight(height: 15),
                                            Text(
                                              'You will book a vacation to Mount Rinjani. Before you set your plans, let us know when you will be leaving and how many people will be traveling with you!',
                                              style: regularText.copyWith(
                                                  color: greyColor),
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
                                                        price * value);
                                                  },
                                                ),
                                              ],
                                            ),
                                            MarginHeight(height: 20),
                                            Text(
                                              'Total Price : ${totalPrice == 0 ? rupiah(price) : rupiah(totalPrice)}',
                                              style: regularText,
                                            ),
                                            MarginHeight(height: 20),
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
