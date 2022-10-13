// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/schedule_model.dart';
import 'package:travel_kuy_app/shared/key.dart';

Future<List<ScheduleModel>?> getSchedules(
    {required String idUser, required BuildContext context}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/schedule?select=*&id_user=eq.$idUser&apikey=$apiKey');
  try {
    var respone =
        await client.get(uri, headers: {'Authorization': 'Bearier $bearier'});
    if (respone.statusCode == 200) {
      var json = respone.body;
      return scheduleModelFromJson(json);
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  return [];
}
