import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/place_model.dart';



Future<List<PlaceModel>?> getPopularPlacesData() async {
  var client = http.Client();
  var uri = Uri.parse('http://10.0.2.2:3000/api/v1/tourism_place/popular');
  var respone = await client.get(uri);
  if (respone.statusCode == 200) {
    var json = respone.body;
    return placeModelFromJson(json);
  }
}