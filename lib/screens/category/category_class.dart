import 'package:flutter/foundation.dart';

class CategoryClass {
  int? index;
  CategoryClass({this.index});
  Map<String, dynamic> toJson() => {
        'index': index,
      };
  factory CategoryClass.fromJson(Map<String, dynamic> json) =>
      CategoryClass(
        index: json['index'] as int,
      );
}