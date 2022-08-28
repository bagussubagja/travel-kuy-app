import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/services/tourism_place_service/recommended_service.dart';

class RecommendedClass extends ChangeNotifier {
 List<PlaceModel>? recommended;
  bool loading = false;
  getRecommendedPlace() async {
    loading = true;
    recommended = (await getRecommededPlacesData())!;
    loading = false;
    notifyListeners();
  }
}
