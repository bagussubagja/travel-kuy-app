import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/comment_model.dart';

import '../../shared/key.dart';

Future<List<CommentModel>?> getCommentTourismPlace(
    {required String id,
    required String idUser,
    required BuildContext context}) async {
  var data = [];
  List<CommentModel> results = [];
  var client = http.Client();
  var uri = Uri.parse(
      'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/comment?select=message,place_tourism_id($id)');
  try {
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearier $bearier'});
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      results = data.map((e) => CommentModel.fromJson(e)).toList();
      // if (query != null) {
      //   results = results
      //       .where((element) =>
      //           element.name.toLowerCase().contains(query.toLowerCase()))
      //       .toList();
      // }
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  return [];
}
