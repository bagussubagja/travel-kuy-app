import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/place_model.dart';

class GetPlaces {
  var data = [];
  List<PlaceModel> results = [];
  String fetchUrl = "http://10.0.2.2:3000/api/v1/tourism_place/";
  Future<List<PlaceModel>> getPlacesList({String? query}) async {
    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);
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
      print(e);
    }
    return results;
  }
}
