// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class ScheduleTileList extends StatelessWidget {
  ScheduleTileList({Key? key}) : super(key: key);

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
      height: MediaQuery.of(context).size.height - 100,
      child: ListView.builder(
          primary: false,
          itemCount: imgUrl.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black45,
              elevation: 4,
              child: ExpansionTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imgUrl[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                iconColor: greyColor,
                expandedCrossAxisAlignment: CrossAxisAlignment.center,
                collapsedTextColor: greyColor,
                collapsedIconColor: greyColor,
                textColor: greyColor,
                title: Text(
                  'Gunung Rinjani',
                  style: regularText,
                ),
                subtitle: Text('Date : ${_date}', style: subTitleText,),
                children: [
                  Text(
                    'Price : ${rupiah(1500000)}',
                    style: subTitleText,
                  ),
                  Text(
                    'Ticket : 2pcs',
                    style: subTitleText,
                  )
                ],
              ),
            );
          }),
    );
  }
}
