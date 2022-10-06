import 'package:cache_manager/cache_manager.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/screens/details/widgets/booking_process.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

import '../../core/schedule_notifier/schedule_notifier.dart';
import '../../models/schedule_model.dart';

class ConfirmationStepperScreen extends StatefulWidget {
  PlaceModel? placeModel;
  FavoriteModel? favModel;
  ConfirmationStepperScreen({this.favModel, this.placeModel, super.key});

  @override
  State<ConfirmationStepperScreen> createState() =>
      _ConfirmationStepperScreenState();
}

class _ConfirmationStepperScreenState extends State<ConfirmationStepperScreen> {
  List<String>? date;
  int indexPage = 0;
  int? totalPrice;
  String idUser = "";
  int? numOfPerson = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      totalPrice = widget.placeModel?.price ?? widget.favModel!.price!;
    });
    ReadCache.getString(key: "cache").then((value) {
      setState(() {
        idUser = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Fill the Information',
        subtitle: 'Please fill some of the basic information to get started',
        content: _chooseADate(),
        validation: () {
          if (date?[1] == null) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Choose a date to continue!')));
            return "null";
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Confirm your book',
        subtitle: 'One more step to get your best vacation!',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Name : ",
              style: regularText,
            ),
            Text(
              widget.placeModel?.name ?? widget.favModel!.name!,
              style: regularText,
            ),
            MarginHeight(height: 10),
            Text(
              'Price : ',
              style: regularText,
            ),
            Text(
              '${rupiah(totalPrice)}/person',
              style: regularText,
            ),
            MarginHeight(height: 10),
            Text(
              'Address : ',
              style: regularText,
            ),
            Text(
              widget.placeModel?.address ?? widget.favModel!.address!,
              style: regularText,
            ),
            MarginHeight(height: 10),
            Text(
              'Start Date\t\t: ${date?[0] ?? "-"}',
              style: regularText,
            ),
            Text(
              'End Date\t\t\t\t: ${date?[1] ?? "-"}',
              style: regularText,
            ),
            MarginHeight(height: 10),
            Row(
              children: [
                Text(
                  'Guests : ',
                  style: regularText,
                ),
                Text(
                  '$numOfPerson person',
                  style: regularText,
                ),
              ],
            ),
            MarginHeight(height: 10),
          ],
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () async {
        try {
          ScheduleModel scheduleModel = ScheduleModel(
              name: widget.placeModel?.name ?? widget.favModel!.name!,
              startDate: date![0],
              endDate: date![1],
              thumbnail:
                  widget.placeModel?.gallery[0] ?? widget.favModel!.gallery![0],
              numOfPerson: numOfPerson ?? 1,
              totalPrice: totalPrice!,
              idUser: idUser);
          var provider = Provider.of<SchedulePostClass>(context, listen: false);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BookingProcess(
                placeName: widget.placeModel?.name ?? widget.favModel!.name!);
          }));
          await provider.postData(scheduleModel);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("There's Something Wrong!")));
        }
      },
      steps: steps,
      config: CoolStepperConfig(
          backText: 'PREV',
          finalText: "CONFIRM",
          iconColor: greenDarkerColor,
          stepText: "STEP",
          nextText: 'NEXT',
          titleTextStyle: titleText,
          subtitleTextStyle: subTitleText),
    );

    return Scaffold(
      backgroundColor: blackBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Book your vacation",
          style: regularText,
        ),
        backgroundColor: blackBackgroundColor,
      ),
      body: Container(
        child: stepper,
      ),
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
  _chooseADate() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name : ",
            style: regularText,
          ),
          Text(
            widget.placeModel?.name ?? widget.favModel!.name!,
            style: regularText,
          ),
          MarginHeight(height: 10),
          Text(
            'Price : ',
            style: regularText,
          ),
          Text(
            '${rupiah(widget.placeModel?.price ?? widget.favModel!.price!)}/person',
            style: regularText,
          ),
          MarginHeight(height: 10),
          Text(
            'Address : ',
            style: regularText,
          ),
          Text(
            widget.placeModel?.address ?? widget.favModel!.address!,
            style: regularText,
          ),
          MarginHeight(height: 10),
          Text(
            'Start Date\t\t: ${date?[0] ?? "-"}',
            style: regularText,
          ),
          Text(
            'End Date\t\t\t\t: ${date?[1] ?? "-"}',
            style: regularText,
          ),
          MarginHeight(height: 10),
          Row(
            children: [
              Text(
                'Guests : ',
                style: regularText,
              ),
              Align(
                alignment: Alignment.center,
                child: CountStepper(
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
                          ? totalPrice = widget.placeModel!.price * value
                          : totalPrice = widget.favModel!.price! * value;
                    });
                  },
                ),
              ),
            ],
          ),
          MarginHeight(height: 10),
          Center(
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: greenDarkerColor),
              child: Text(
                'Choose dates',
                style: regularText,
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
          ),
        ],
      ),
    );
  }
}
