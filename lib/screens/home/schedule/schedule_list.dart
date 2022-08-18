import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:intl/intl.dart';

class ScheduleList extends StatelessWidget {
  ScheduleList({Key? key}) : super(key: key);

  List<String> imgUrl = [
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/mountain.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
    'assets/images/beach.jpg',
    'assets/images/island.jpg',
    'assets/images/mountain.jpg',
    'assets/images/lake.png',
    'assets/images/waterfall.jpg',
  ];

  String _date = DateFormat('dd MMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        separatorBuilder: (context, index) => MarginHeight(height: 20),
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(imgUrl[index]), fit: BoxFit.cover),
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gunung Rinjani asmdhjasgdhjasghd', style: regularText,),
                    Text('Date : ${_date}', style: subTitleText,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
