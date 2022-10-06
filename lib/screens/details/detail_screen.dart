import 'dart:ui';
import 'package:cache_manager/cache_manager.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indonesia/indonesia.dart';
import 'package:provider/provider.dart';
import 'package:switch_tab/switch_tab.dart';
import 'package:travel_kuy_app/core/fav_notifier/favorite_notifier.dart';
import 'package:travel_kuy_app/core/fav_notifier/favorite_notifier.dart';
import 'package:travel_kuy_app/core/schedule_notifier/schedule_notifier.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/models/schedule_model.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/screens/details/confirmation_stepper_screen.dart';
import 'package:travel_kuy_app/screens/details/overview_page.dart';
import 'package:travel_kuy_app/screens/details/review_page.dart';
import 'package:travel_kuy_app/screens/details/widgets/booking_process.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/custom_nav_button.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/margin_widget_width.dart';

import '../../widgets/my_textfield.dart';

class DetailScreen extends StatefulWidget {
  PlaceModel? placeModel;
  FavoriteModel? favModel;
  String? idUser;
  DetailScreen({Key? key, this.placeModel, this.favModel}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String>? date;
  int indexPage = 0;
  int totalPrice = 0;
  String idUser = "";
  int? numOfPerson;

  @override
  void initState() {
    super.initState();

    final fav = Provider.of<FavoritePlaceClass>(context, listen: false);
    ReadCache.getString(key: "cache").then(
      (value) {
        setState(() {
          idUser = value;
        });
      },
    );
    fav.getUserData(idUser: idUser);
    if (widget.placeModel?.price == null) {
      totalPrice = totalPrice + widget.favModel!.price!;
    } else if (widget.favModel?.price == null) {
      totalPrice = totalPrice + widget.placeModel!.price;
    } else {
      totalPrice = 0;
    }
    //totalPrice = totalPrice + widget.placeModel!.price;
  }

  @override
  Widget build(BuildContext context) {
    ReadCache.getString(key: "cache").then((value) {
      setState(() {
        widget.idUser = value;
      });
    });
    final fav = Provider.of<FavoritePlaceClass>(context);
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
                          child: widget.placeModel?.gallery[0] == null
                              ? Image.network(
                                  widget.favModel!.gallery![0],
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.placeModel!.gallery[0],
                                  fit: BoxFit.cover,
                                )),
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
                            bgColor: Colors.black.withOpacity(0.5),
                            child: IconButton(
                                onPressed: () async {
                                  if (widget.favModel == null) {
                                    // FavoriteModel favoriteModel = FavoriteModel(
                                    //   idPlace: widget.placeModel!.id,
                                    //   idUser: widget.idUser!,
                                    //   favUnique: '${widget.idUser!}_${widget.placeModel!.id}',
                                    // );
                                    FavoriteModel favoriteModel = FavoriteModel(
                                        idPlace: widget.placeModel!.id,
                                        idUser: widget.idUser!,
                                        favUnique:
                                            '${widget.idUser!}_${widget.placeModel!.id}');
                                    var provider =
                                        Provider.of<FavPostDataClass>(context,
                                            listen: false);
                                    print(favoriteModel);
                                    await provider.postData(
                                        favoriteModel, context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Place Deleted from Favorite"),
                                      ),
                                    );
                                    await fav.deleteUserData(
                                        id: widget.favModel!.id!);
                                    Navigator.pop(context);
                                    // Navigator.pushNamed(
                                    //     context, AppRoutes.bodyScreen);
                                  }
                                },
                                icon: widget.favModel == null
                                    ? Icon(
                                        Icons.favorite,
                                        color: whiteColor,
                                      )
                                    : Icon(
                                        Icons.delete,
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
                                  Text(
                                      widget.placeModel?.name ??
                                          widget.favModel!.name!,
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
                                      widget.favModel?.district == null
                                          ? Expanded(
                                              child: Text(
                                                  '${widget.placeModel?.district}, ${widget.placeModel?.province}',
                                                  style: subTitleText.copyWith(
                                                      fontSize: 14)),
                                            )
                                          : Expanded(
                                              child: Text(
                                                  '${widget.favModel?.district}, ${widget.favModel?.province}',
                                                  style: subTitleText.copyWith(
                                                      fontSize: 14)),
                                            )
                                    ],
                                  ),
                                  MarginHeight(height: 5),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating:
                                            widget.placeModel?.rating == null
                                                ? double.parse(
                                                    widget.favModel!.rating!)
                                                : double.parse(
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
                                      Text(
                                          widget.placeModel?.rating ??
                                              widget.favModel!.rating!,
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
                          favModel: widget.favModel,
                          placeModel: widget.placeModel,
                        )
                      : ReviewPage(
                          placeModel: widget.placeModel,
                          favModel: widget.favModel),
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
                            widget.placeModel?.price == null
                                ? rupiah(widget.favModel!.price)
                                : rupiah(widget.placeModel!.price),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ConfirmationStepperScreen(
                              favModel: widget.favModel,
                              placeModel: widget.placeModel,
                            );
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: greenDarkerColor),
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

  Future showModal() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: MediaQuery.of(context).size.height,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MarginHeight(height: 10),
                      Center(
                        child: Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      MarginHeight(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 65,
                                width: 65,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    widget.placeModel?.gallery[0] ??
                                        widget.favModel!.gallery![0],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              MarginWidth(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.placeModel?.name ??
                                        widget.favModel!.name!,
                                    style: regularText,
                                  ),
                                  Text(
                                    '${rupiah(widget.placeModel?.price ?? widget.favModel!.price)}/person',
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
                        'You will book a vacation to ${widget.placeModel?.name ?? widget.favModel!.name}. Before you set your plans, let us know when you will be leaving and how many people will be traveling with you!',
                        style: regularText.copyWith(
                            color: greyColor, fontSize: 16),
                      ),
                      _buildCalendarDialogButton(),
                      MarginHeight(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Price : ${totalPrice == 0 ? rupiah(widget.placeModel?.price ?? widget.favModel!.price) : rupiah(totalPrice)}',
                            style: regularText,
                          ),
                          CountStepper(
                            iconColor: greenLightColor,
                            textStyle: regularText,
                            iconIncrementColor: greenLightColor,
                            defaultValue: 1,
                            max: 100,
                            min: 1,
                            iconDecrementColor: greenLightColor,
                            splashRadius: 50,
                            onPressed: (value) {
                              setState(() {
                                numOfPerson = value;
                                widget.favModel?.price == null
                                    ? totalPrice =
                                        widget.placeModel!.price * value
                                    : totalPrice =
                                        widget.favModel!.price! * value;
                              });
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
                              backgroundColor: greenDarkerColor),
                          onPressed: () async {
                            ScheduleModel scheduleModel = ScheduleModel(
                                name: widget.placeModel?.name ??
                                    widget.favModel!.name!,
                                startDate: date?[0] ??
                                    DateTime(2022, 10, 01)
                                        .toString()
                                        .substring(0, 10),
                                endDate: date?[1] ??
                                    DateTime(2022, 10, 07)
                                        .toString()
                                        .substring(0, 10),
                                thumbnail: widget.placeModel?.gallery[0] ??
                                    widget.favModel!.gallery![0],
                                numOfPerson: numOfPerson ?? 1,
                                totalPrice: totalPrice,
                                idUser: idUser);
                            var provider = Provider.of<SchedulePostClass>(
                                context,
                                listen: false);
                            await provider.postData(scheduleModel);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BookingProcess(
                                  placeName: widget.placeModel?.name ??
                                      widget.favModel!.name!);
                            }));
                            // Navigator
                            //     .pushNamedAndRemoveUntil(
                            //         context,
                            //         AppRoutes
                            //             .bookingProcess,
                            //         (route) => false);
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
  }

  List<String> _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '${startDate.trim()} ${endDate.trim()}';
      } else {
        return [];
      }
    }
    date = valueText.split(' ');
    return date ?? [];
  }

  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2022, 10, 01),
    DateTime(2022, 10, 07),
  ];
  _buildCalendarDialogButton() {
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      dayTextStyle: TextStyle(color: whiteColor),
      yearTextStyle: TextStyle(color: whiteColor),
      disabledDayTextStyle: TextStyle(color: greyColor),
      todayTextStyle: TextStyle(color: whiteColor),
      weekdayLabelTextStyle: TextStyle(color: whiteColor),
      selectedDayHighlightColor: greenDarkerColor,
      controlsTextStyle: TextStyle(color: whiteColor),
      selectedDayTextStyle: TextStyle(color: whiteColor),
      shouldCloseDialogAfterCancelTapped: true,
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.calendar_month_rounded,
              color: whiteColor,
            ),
            onPressed: () async {
              final values = await showCalendarDatePicker2Dialog(
                context: context,
                config: config,
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
                initialValue: _dialogCalendarPickerValue,
                dialogBackgroundColor: blackBackgroundColor,
                selectableDayPredicate: (day) => !day
                    .difference(_dialogCalendarPickerValue[0]!
                        .subtract(const Duration(days: 5)))
                    .isNegative,
              );
              if (values != null) {
                // ignore: avoid_print
                print(_getValueText(
                  config.calendarType,
                  values,
                ));
                setState(() {
                  _dialogCalendarPickerValue = values;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
