import 'package:flutter/material.dart';
import 'package:travel_kuy_app/screens/home/schedule/schedule_tile_list.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/content_not_found.dart';

import '../../../widgets/margin_widget_height.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Schedule',
                style: titleText,
              ),
             MarginHeight(height: 5),
              Text("Lorem Ipsum Dolor Sit Amet 🗓️", style: subTitleText,),
              MarginHeight(height: 20),
              ScheduleTileList()
            ],
          ),
        ),
      )),
    );
  }
}
