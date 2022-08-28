import 'package:cache_manager/core/write_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import '../../services/auth_service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<String?> signUp(
      {required BuildContext context,
        required String email,
        required String password}) async {
    try {
      dynamic userId = await _authenticationService.signUp(email: email, password: password);
      WriteCache.setString(key: "cache", value: userId!);
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.bodyScreen, (route) => false);
    } catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return null;
  }

  Future<String?> login(
      {required BuildContext context,
        required String email,
        required String password}) async {
    try {
      dynamic userId =
      await _authenticationService.login(email: email, password: password);
      WriteCache.setString(key: "cache", value: userId!);
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.bodyScreen, (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _authenticationService.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
