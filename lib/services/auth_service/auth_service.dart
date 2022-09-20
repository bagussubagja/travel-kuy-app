import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

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
