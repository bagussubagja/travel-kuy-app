import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/services/tourism_place_service/mostviewed_service.dart';
import 'package:travel_kuy_app/services/tourism_place_service/recommended_service.dart';

class MostViewedClass extends ChangeNotifier {
 List<PlaceModel>? mostViewed;
  bool loading = false;
  getMostViewedPlace() async {
    loading = true;
    mostViewed = (await getMostViewedPlacesData())!;
    loading = false;
    notifyListeners();
  }
}
