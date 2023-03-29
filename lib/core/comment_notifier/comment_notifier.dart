// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/services/comment_section_service/add_comment_services.dart';
import 'package:travel_kuy_app/services/comment_section_service/get_comment_services.dart';

class CommentClass extends ChangeNotifier {
  List<CommentModel>? com;
  bool loading = false;
  getCommentContent(
      {required int idPlace, required BuildContext context}) async {
    loading = true;
    com =
        (await getCommentServiceByIdPlace(idPlace: idPlace, context: context));
    loading = false;
    notifyListeners();
  }
}

class AddCommentClass extends ChangeNotifier {
  bool loading = false;
  Future<void> addComment(CommentModel body, BuildContext context) async {
    loading = true;
    notifyListeners();
    http.Response response = (await addCommentService(body, context))!;
    if (response.statusCode == 200) {
      loading = false;
    }

    notifyListeners();
  }
}
