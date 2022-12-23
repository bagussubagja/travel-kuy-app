// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/shared/key.dart';

Future<List<FavoriteModel>?> getFavoritePlacebyid(
    {required String idUser, required BuildContext context}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/fav_place?select=*,tourism_place(*)&id_user=eq.$idUser&apikey=$apiKey');
  try {
    var respone =
        await client.get(uri, headers: {'Authorization': 'Bearier $bearier'});
    if (respone.statusCode == 200) {
      var json = respone.body;
      return favoriteModelFromJson(json);
    }
  } catch (e) {
   debugPrint(e.toString());
  }
  return [];
}
