import 'package:supabase/supabase.dart';

import '../credentials/supabase_credentials.dart';

class AuthenticationService {
  Future<void> signOut() async {
    await SupabaseCredentials.supabaseClient.auth.signOut();
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    GotrueSessionResponse respone =
    await SupabaseCredentials.supabaseClient.auth.signUp(email, password);
    if (respone.error == null) {
      String? id = respone.data!.user!.id;
      String? userEmail = respone.data!.user!.email;
      print("Sign up success : $userEmail");
      return id;
    } else {
      print("Sign up Error : ${respone.error!.message}");
    }
    return null;
  }

  Future<String?> login(
      {required String email, required String password}) async {
    GotrueSessionResponse respone =
    await SupabaseCredentials.supabaseClient.auth.signIn(
        email: email,
        password: password,
        options: AuthOptions(redirectTo: SupabaseCredentials.APIURL));
    if (respone.error == null) {
      String? id = respone.data!.user!.id;
      String? userEmail = respone.data!.user!.email;
      print("Login success : $userEmail");
      return id;
    } else {
      print("Login Error : ${respone.error!.message}");
    }
    return null;
  }

}