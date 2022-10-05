import 'package:cache_manager/core/write_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:travel_kuy_app/models/user_model.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/screens/authentication/biodata_screen.dart';
import 'package:travel_kuy_app/screens/home/home_page.dart';
import 'package:travel_kuy_app/services/user_service/user_services.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import '../../services/auth_service/auth_service.dart';
import 'package:http/http.dart' as http;

class RegisterDataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(UserModel body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}

class UserPostDataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(UserModel body, String idUser) async {
    loading = true;
    notifyListeners();
    http.Response response = (await updateUserData(body, idUser))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}


class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<String?> signUp(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      dynamic userId = await _authenticationService.signUp(
          email: email, password: password, context: context);
      WriteCache.setString(key: "cache", value: userId!);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BiodataUser(
          email: email,
          password: password,
        );
      }));
      // Navigator.pushNamedAndRemoveUntil(
      //     context, AppRoutes.bodyScreen, (route) => false);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<String?> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      dynamic userId = await _authenticationService.login(
          email: email, password: password, context: context);
      WriteCache.setString(key: "cache", value: userId!);
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.bodyScreen, (route) => false);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _authenticationService.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
