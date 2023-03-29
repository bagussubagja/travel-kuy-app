import 'package:flutter/cupertino.dart';
import 'package:travel_kuy_app/models/user_model.dart';
import 'package:travel_kuy_app/services/user_service/user_services.dart';

class UserClass extends ChangeNotifier {
 UserModel? user;
  bool loading = false;
  getUserData({required String idUser}) async {
    loading = true;
    user = (await getUserDataById(idUser: idUser));
    loading = false;
    notifyListeners();
  }
}