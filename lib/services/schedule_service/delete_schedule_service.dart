import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/schedule_model.dart';
import 'package:travel_kuy_app/models/user_model.dart';

Future<List<ScheduleModel>?> deleteSchedule(
    {required int id, required BuildContext context}) async {
  var client = http.Client();
  var uri = Uri.parse('http://10.0.2.2:3000/api/v1/schedule/$id');
  try {
    var respone = await client.delete(uri);
    if (respone.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(respone.body)));
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
