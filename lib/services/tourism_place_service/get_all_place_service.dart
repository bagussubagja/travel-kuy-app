// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/place_model.dart';

import '../../shared/key.dart';

class GetPlaces {
  var data = [];
  List<PlaceModel> results = [];
  String fetchUrl =
      "https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/tourism_place?select=*&apikey=$apiKey";
  Future<List<PlaceModel>> getPlacesList({String? query}) async {
    var url = Uri.parse(fetchUrl);
    var response = await http.get(url, headers: {
      'Authorization' : 'Bearier $bearier'
    });
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => PlaceModel.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return results;
  }
}
