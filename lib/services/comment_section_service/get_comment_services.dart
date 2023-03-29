// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/shared/key.dart';

Future<List<CommentModel>?> getCommentServiceByIdPlace(
    {required int idPlace, required BuildContext context}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/comment?select=*,users(*)&apikey=$apiKey&place_tourism_id=eq.$idPlace');
  try {
    var respone =
        await client.get(uri, headers: {'Authorization': 'Bearier $bearier'});
    if (respone.statusCode == 200) {
      var json = respone.body;
      return commentModelFromJson(json);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return [];
}
