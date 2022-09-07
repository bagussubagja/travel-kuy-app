import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/services/tourism_place_service/popular_service.dart';

class PopularClass extends ChangeNotifier {
 List<PlaceModel>? popular;
  bool loading = false;
  getPopularPlace() async {
    loading = true;
    popular = (await getPopularPlacesData())!;
    loading = false;
    notifyListeners();
  }
}
