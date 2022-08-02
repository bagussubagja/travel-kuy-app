// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MarginWidth extends StatelessWidget {
  double width;
  MarginWidth({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
