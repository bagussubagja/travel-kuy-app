// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/shared/key.dart';

Future<List<PlaceModel>?> getStatusPlaceData({required String status}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/tourism_place?select=*&status=eq.$status&apikey=$apiKey');
  var respone =
      await client.get(uri, headers: {'Authorization': 'Bearier $bearier'});
  if (respone.statusCode == 200) {
    var json = respone.body;
    return placeModelFromJson(json);
  }
  return [];
}
