import 'package:flutter/material.dart';

class MarginHeight extends StatelessWidget {
  double height;
  MarginHeight({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
