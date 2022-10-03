import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class BookingSuccess extends StatelessWidget {
  String placeName;
  BookingSuccess({Key? key, required this.placeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 250, left: 20, right: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: LottieBuilder.asset(
                      'assets/lottie/success_confirm_dialogue.json'),
                ),
                Text(
                  'Success!',
                  style: titleText,
                ),
                MarginHeight(height: 10),
                Text(
                  'You have successfully booked "$placeName" as your next vacation destination, have fun!',
                  style: regularText,
                  textAlign: TextAlign.center,
                ),
                MarginHeight(height: 15),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.bodyScreen, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(primary: greenDarkerColor),
                    child: Text(
                      'Back to Main Menu',
                      style: regularText,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
