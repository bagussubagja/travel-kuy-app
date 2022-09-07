import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/place_model.dart';

class FavoriteNotifier extends ChangeNotifier {
  List<PlaceModel> _placeModel = [];

  List<PlaceModel> get placeModel => _placeModel;

  void toggleFavorite(PlaceModel placeModel) {
    final isExist = _placeModel.contains(placeModel);
    if (isExist) {
      _placeModel.remove(placeModel);
    } else {
      _placeModel.add(placeModel);
    }
    notifyListeners();
  }

  bool isExist(PlaceModel placeModel) {
    final isExist = _placeModel.contains(placeModel);
    return isExist;
  }

  void clearFavorite() {
    _placeModel = [];
    notifyListeners();
  }
}
