import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/place_model.dart';
import 'package:travel_kuy_app/services/tourism_place_service/categories_place_services.dart';

class BeachClass extends ChangeNotifier {
  List<PlaceModel>? beach;
  bool loading = false;
  getCatagoryPlaces() async {
    loading = true;
    beach = (await getDataPlacesByCatagoryData(category: "Beach"))!;
    loading = false;
    notifyListeners();
  }
}

class IslandClass extends ChangeNotifier {
  List<PlaceModel>? island;
  bool loading = false;
  getCatagoryPlaces() async {
    loading = true;
    island = (await getDataPlacesByCatagoryData(category: "Island"))!;
    loading = false;
    notifyListeners();
  }
}

class LakeClass extends ChangeNotifier {
  List<PlaceModel>? lake;
  bool loading = false;
  getCatagoryPlaces() async {
    loading = true;
    lake = (await getDataPlacesByCatagoryData(category: "Lake"))!;
    loading = false;
    notifyListeners();
  }
}

class MountainClass extends ChangeNotifier {
  List<PlaceModel>? mountain;
  bool loading = false;
  getCatagoryPlaces() async {
    loading = true;
    mountain = (await getDataPlacesByCatagoryData(category: "Mountain"))!;
    loading = false;
    notifyListeners();
  }
}

class ParkClass extends ChangeNotifier {
  List<PlaceModel>? park;
  bool loading = false;
  getCatagoryPlaces() async {
    loading = true;
    park = (await getDataPlacesByCatagoryData(category: "Park"))!;
    loading = false;
    notifyListeners();
  }
}

class WaterfallClass extends ChangeNotifier {
  List<PlaceModel>? waterfall;
  bool loading = false;
  getCatagoryPlaces() async {
    loading = true;
    waterfall = (await getDataPlacesByCatagoryData(category: "Waterfall"))!;
    loading = false;
    notifyListeners();
  }
}
