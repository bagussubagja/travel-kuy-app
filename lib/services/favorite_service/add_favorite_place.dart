import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/favorite_model.dart';

Future<http.Response?> register(FavoriteModel data, BuildContext context) async {
  http.Response? respone;
  try {
    respone = await http.post(
        Uri.parse('http://10.0.2.2:3000/api/v1/favorite/'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(data.toJson()));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(respone.body)));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  print(respone);
  return respone;
}
