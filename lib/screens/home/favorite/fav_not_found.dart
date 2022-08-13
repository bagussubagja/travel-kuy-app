import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class FavNotFound extends StatelessWidget {
  const FavNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 220,
          child: SvgPicture.asset(
            'assets/svg/not_found.svg',
          ),
        ),
        MarginHeight(height: 10),
        Text(
          'You have no favorites :(',
          style: regularText,
        )
      ],
    );
  }
}
