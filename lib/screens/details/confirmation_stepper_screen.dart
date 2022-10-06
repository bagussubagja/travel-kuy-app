import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/shared/theme.dart';

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
  int totalPrice = 0;
  String idUser = "";
  int? numOfPerson;
  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Select a date',
        subtitle: 'Please fill some of the basic information to get started',
        content: _buildCalendarDialogButton(),
        validation: () {},
      ),
      CoolStep(
        title: 'Buy Ticket',
        subtitle: 'How much person will join your vacation this time?',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.placeModel?.name ?? widget.favModel!.name!,
              style: regularText,
            ),
            Text(
              'Price : ${rupiah(widget.placeModel?.price ?? widget.favModel!.price!)}/night',
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
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Confirm',
        subtitle: 'How much person will join your vacation this time?',
        content: Column(
          children: [
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
                      ? totalPrice = widget.placeModel!.price * value
                      : totalPrice = widget.favModel!.price! * value;
                });
              },
            ),
          ],
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        print('Steps completed!');
      },
      steps: steps,
      config: CoolStepperConfig(
          backText: 'PREV',
          finalText: "Let's Pay!",
          iconColor: greenDarkerColor,
          stepText: "Step",
          titleTextStyle: titleText,
          subtitleTextStyle: subTitleText),
    );

    return Scaffold(
      backgroundColor: blackBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Confirm your schedule",
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  'Click me to Start 🗓️',
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
            ],
          ),
          Text(
            'Start Date : ${date?[0] ?? "-"}',
            style: regularText,
          ),
          Text(
            'End Date : ${date?[1] ?? "-"}',
            style: regularText,
          )
        ],
      ),
    );
  }
}
