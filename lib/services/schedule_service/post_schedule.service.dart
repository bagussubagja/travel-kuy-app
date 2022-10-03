import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/schedule_model.dart';

Future<http.Response?> AddSchedule(
    ScheduleModel data) async {
  http.Response? respone;
  try {
    respone = await http.post(
        Uri.parse('http://10.0.2.2:3000/api/v1/schedule/'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(data.toJson()));
  } catch (e) {
    print(e);
  }
  print(respone);
  return respone;
}
