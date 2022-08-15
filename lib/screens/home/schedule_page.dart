import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:intl/intl.dart';
import 'package:travel_kuy_app/screens/details/review_page.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime _currentDate = DateTime.now();

  bool isVisible = false;
  int? thisDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FlutterCalendar(
              locale: 'en',
              isHeaderDisplayed: true,
              style: CalendarStyle(
                headerLeftIcon: Icon(
                  Icons.arrow_back_ios,
                  color: whiteColor,
                ),
                headerRightIcon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: whiteColor,
                ),
              ),
              startingDayOfWeek: DayOfWeek.mon,
              textStyle: CalendarTextStyle(
                  dayFontSize: 16,
                  dayTextColor: whiteColor,
                  focusedDayTextColor: greenDarkerColor,
                  rangeDayTextColor: greenLightColor,
                  headerTextStyle: regularText,
                  outsideDayTextColor: greyColor,
                  dayOfWeekTextColor: whiteColor,
                  selectedDayTextColor: greenLightColor),
              selectionMode: CalendarSelectionMode.single,
              onDayPressed: (date) {
                setState(() {
                  thisDate = date.day..compareTo(_currentDate.weekday);
                });
                print(thisDate);
                print('Current Date : $_currentDate');
                print('Date Selected : $date');
              },
            ),
            thisDate == 0
                ? ReviewPage()
                : Center(
                    child: Text(
                      'Data Not Found!',
                      style: regularText,
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
