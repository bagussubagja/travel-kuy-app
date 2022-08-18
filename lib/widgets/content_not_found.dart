import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class ContentNotFound extends StatelessWidget {
  String? pageName;
  ContentNotFound({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          MarginHeight(height: MediaQuery.of(context).size.height / 10),
          Image.asset('assets/images/not_found.png'),
          MarginHeight(height: 10),
          Text(
            '$pageName not found :(',
            style: titleText
          ),
        ],
      ),
    );
  }
}
