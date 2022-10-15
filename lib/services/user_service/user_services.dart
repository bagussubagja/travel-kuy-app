// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/user_model.dart';
import 'package:travel_kuy_app/shared/key.dart';

Future<List<UserModel>?> getUserDataById({required String idUser}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/users?select=*&id_user=eq.$idUser&apikey=$apiKey');
  var respone = await client.get(uri);
  if (respone.statusCode == 200) {
    var json = respone.body;
    return userModelFromJson(json);
  }
  return [];
}

Future<http.Response?> updateUserData(
    UserModel data, String idUser, BuildContext context) async {
  http.Response? respone;
  try {
    respone = await http.patch(
        Uri.parse('https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/users?id_user=eq.$idUser&apikey=$apiKey'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(data.updateName()));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  return respone;
}
