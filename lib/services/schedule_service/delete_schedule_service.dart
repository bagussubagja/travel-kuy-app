// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/schedule_model.dart';
import 'package:travel_kuy_app/shared/key.dart';

Future<List<ScheduleModel>?> deleteSchedule(
    {required int id, required BuildContext context}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/schedule?id=eq.$id&apikey=$apiKey');
  try {
    var respone = await client.delete(uri, headers: {
      'Authorization': 'Bearier $bearier'
    });
    if (respone.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(respone.body)));
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  return [];
}
