// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/comment_model.dart';

import '../../shared/key.dart';

Future<http.Response?> addCommentService(
    CommentModel data, BuildContext context) async {
  http.Response? respone;
  try {
    respone = await http.post(
        Uri.parse(
            'https://zkyiyylcyurpymivrwnz.supabase.co/rest/v1/comment?apikey=$apiKey'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          'Authorization': 'Bearier $bearier'
        },
        body: jsonEncode(data.toJson()));
    
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  debugPrint(respone.toString());
  return respone;
}