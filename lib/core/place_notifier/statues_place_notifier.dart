import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/services/tourism_place_service/recommended_service.dart';
import 'package:travel_kuy_app/services/tourism_place_service/statues_place_services.dart';

class RecommendedClass extends ChangeNotifier {
 List<PlaceModel>? recommended;
  bool loading = false;
  getRecommendedPlace() async {
    loading = true;
    recommended = (await getStatusPlaceData(status: "recommended"))!;
    loading = false;
    notifyListeners();
  }
}

class PopularClass extends ChangeNotifier {
 List<PlaceModel>? popular;
  bool loading = false;
  getPopularPlace() async {
    loading = true;
    popular = (await getStatusPlaceData(status: "popular"))!;
    loading = false;
    notifyListeners();
  }
}

class NewlyAddedClass extends ChangeNotifier {
 List<PlaceModel>? newly;
  bool loading = false;
  getNewlyAddedPlace() async {
    loading = true;
    newly = (await getStatusPlaceData(status: "newlyadded"))!;
    loading = false;
    notifyListeners();
  }
}

class MostViewedClass extends ChangeNotifier {
 List<PlaceModel>? mostView;
  bool loading = false;
  getMostViewedPlace() async {
    loading = true;
    mostView = (await getStatusPlaceData(status: "mostviewed"))!;
    loading = false;
    notifyListeners();
  }
}