// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/user_model.dart';
import 'package:travel_kuy_app/shared/key.dart';
import '../../credentials/supabase_credentials.dart';
import '../../shared/theme.dart';

class AuthenticationService {
  Future<void> signOut() async {
    await SupabaseCredentials.supabaseClient.auth.signOut();
  }

  Future<String?> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    GotrueSessionResponse respone =
        await SupabaseCredentials.supabaseClient.auth.signUp(email, password);
    if (respone.error == null) {
      String? id = respone.data!.user!.id;
      return id;
    } else {
      if (kDebugMode) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Sign up Error : ${respone.error!.message}",
              style: regularText,
            ),
          ),
        );
      }
    }
    return null;
  }

  Future<String?> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    GotrueSessionResponse respone =
        await SupabaseCredentials.supabaseClient.auth.signIn(
            email: email,
            password: password,
            options: AuthOptions(redirectTo: SupabaseCredentials.APIURL));
    if (respone.error == null) {
      String? id = respone.data!.user!.id;
      String? userEmail = respone.data!.user!.email;

      if (kDebugMode) {
        print("Login success : $userEmail");
      }
      return id;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Login Error : ${respone.error!.message}",
            style: regularText,
          ),
        ),
      );
    }
    return null;
  }
}

Future<http.Response?> register(UserModel data) async {
  http.Response? respone;
  try {
    respone = await http.post(
        Uri.parse(
            'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/users?apikey=$apiKey'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(data.toJson()));
  } catch (e) {
    debugPrint(e.toString());
  }
  return respone;
}
