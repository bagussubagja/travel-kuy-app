import 'package:flutter/material.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: blackBackgroundColor,
        body: SizedBox(
          child: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hi, ',
                            style: subTitleText.copyWith(color: whiteColor),
                          ),
                          Text(
                            'Bagus Subagja 👋',
                            style: subTitleText.copyWith(
                                fontWeight: FontWeight.w500, color: whiteColor),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: greenDarkerColor,
                        radius: 25,
                        child: CircleAvatar(
                          backgroundColor: whiteColor,
                          radius: 20,
                          child: Image.asset(
                            'assets/images/avatar.png',
                          ),
                        ),
                      )
                    ],
                  ),
                  MarginHeight(height: 15),
                  Text(
                    'Explore and Find your Best Journey!',
                    style: titleText,
                  ),
                  MarginHeight(height: 15),
                  MyTextField(
                    titleText: "",
                    hintText: "Search Destination...",
                    prefixIcon: Icon(
                      Icons.search,
                      color: greyColor,
                    ),
                  ),
                  MarginHeight(height: 15),
                  Text(
                    'Explore Destination',
                    style: regularText,
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
