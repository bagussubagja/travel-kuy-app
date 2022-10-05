import 'dart:convert';
import 'dart:io';

import 'package:cache_manager/cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/user_model.dart';

Future<List<UserModel>?> getUserDataById({required String idUser}) async {
  var client = http.Client();
  var uri = Uri.parse('http://10.0.2.2:3000/api/v1/users/$idUser');
  var respone = await client.get(uri);
  if (respone.statusCode == 200) {
    var json = respone.body;
    return userModelFromJson(json);
  }
}

Future<http.Response?> updateUserData(
    UserModel data, String idUser) async {
  http.Response? respone;
  try {
    respone = await http.put(
        Uri.parse('http://10.0.2.2:3000/api/v1/users/$idUser'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(data.updateName()));
  } catch (e) {
    print(e);
  }
  print(respone);
  return respone;
}
