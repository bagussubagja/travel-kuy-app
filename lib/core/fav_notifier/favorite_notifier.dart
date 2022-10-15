// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/services/favorite_service/add_favorite_place.dart';
import 'package:travel_kuy_app/services/favorite_service/delete_favorite_place.dart';
import 'package:travel_kuy_app/services/favorite_service/favorite_service.dart';
import 'package:http/http.dart' as http;

class FavoritePlaceClass extends ChangeNotifier {
  List<FavoriteModel>? fav;
  bool loading = false;
  getUserData({required String idUser, required BuildContext context}) async {
    loading = true;
    fav = (await getFavoritePlacebyid(idUser: idUser, context: context));
    loading = false;
    notifyListeners();
  }

  deleteUserData({required int id, required BuildContext context}) async {
    loading = true;
    fav = (await deleteFavoritePlace(id: id, context: context));
    loading = false;
    notifyListeners();
  }
}

class FavPostDataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(FavoriteModel body, BuildContext context) async {
    loading = true;
    notifyListeners();
    http.Response response = (await addFavorite(body, context))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}
