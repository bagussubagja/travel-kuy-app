// ignore_for_file: must_be_immutable

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/core/schedule_notifier/schedule_notifier.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class ScheduleTileList extends StatefulWidget {
  String? value;
  ScheduleTileList({Key? key}) : super(key: key);

  @override
  State<ScheduleTileList> createState() => _ScheduleTileListState();
}

class _ScheduleTileListState extends State<ScheduleTileList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<ScheduleClass>(context, listen: false);
    ReadCache.getString(key: "cache").then((value) {
      setState(() {
        widget.value = value;
      });
    });
    schedule.getUserData(idUser: widget.value ?? "");

    return SizedBox(
      height: MediaQuery.of(context).size.height - 100,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: schedule.schedule?.length ?? 0,
          itemBuilder: (context, index) {
            final item = schedule.schedule?[index];
            return Card(
              color: Colors.black45,
              elevation: 4,
              child: ExpansionTile(
                leading: SizedBox(
                  height: 75,
                  width: 75,
                  child: item?.thumbnail == null
                      ? const CircularProgressIndicator()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            item!.thumbnail,
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
                  item?.name ?? "",
                  style: regularText,
                ),
                subtitle: Text(
                  '📅 ${item?.startDate.replaceAll("-", "/")} - ${item?.endDate.replaceAll("-", "/")}',
                  style: subTitleText,
                ),
                children: [
                  Text(
                    'Price : ${rupiah(item?.totalPrice)}',
                    style: subTitleText,
                  ),
                  Text(
                    'Ticket : ${item?.numOfPerson}',
                    style: subTitleText,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await schedule.deleteScheduleUser(id: item?.id ?? 0);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: redColor),
                    child: Text(
                      'Delete',
                      style: regularText,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
