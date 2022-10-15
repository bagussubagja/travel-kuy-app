// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/schedule_model.dart';
import 'package:travel_kuy_app/services/schedule_service/delete_schedule_service.dart';
import 'package:travel_kuy_app/services/schedule_service/get_schedule_service.dart';
import 'package:travel_kuy_app/services/schedule_service/post_schedule.service.dart';
import 'package:http/http.dart' as http;

class ScheduleClass extends ChangeNotifier {
  List<ScheduleModel>? schedule;
  bool loading = false;
  getUserData({required String idUser, required BuildContext context}) async {
    loading = true;
    schedule = (await getSchedules(idUser: idUser, context: context));
    loading = false;
    notifyListeners();
  }

    deleteScheduleUser({required int id, required BuildContext context}) async {
    loading = true;
    schedule = (await deleteSchedule(id: id, context: context));
    loading = false;
    notifyListeners();
  }
}

class SchedulePostClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData({required ScheduleModel body, required BuildContext context}) async {
    loading = true;
    notifyListeners();
    http.Response response = (await addSchedule(body, context))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}
