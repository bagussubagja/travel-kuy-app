import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/services/tourism_place_service/newlyadded_service.dart';
import 'package:travel_kuy_app/services/tourism_place_service/popular_service.dart';

class NewlyAddedClass extends ChangeNotifier {
 List<PlaceModel>? newly;
  bool loading = false;
  getNewlyAddedPlace() async {
    loading = true;
    newly = (await getNewlyAddedPlacesData())!;
    loading = false;
    notifyListeners();
  }
}
