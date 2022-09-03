import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/services/tourism_place_service/recommended_service.dart';

class AllClass extends ChangeNotifier {
 List<PlaceModel>? all;
  bool loading = false;
  getAllPlace() async {
    loading = true;
    all = (await getAllPlace())!;
    loading = false;
    notifyListeners();
  }
}
