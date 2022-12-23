// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/shared/key.dart';
import 'package:travel_kuy_app/shared/theme.dart';

Future<http.Response?> addFavorite(
    FavoriteModel data, BuildContext context) async {
  http.Response? respone;
  try {
    respone = await http.post(
        Uri.parse(
            'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/fav_place?apikey=$apiKey&on_conflict=fav_unique'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          'Authorization': 'Bearier $bearier'
        },
        body: jsonEncode(data.toJson()));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "Item Successfully Added to Favorite!",
      style: regularText,
    )));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  debugPrint(respone.toString());
  return respone;
}
