import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/routes.dart';
import '../../../shared/theme.dart';
import '../../../widgets/margin_widget_height.dart';

class BookingFailed extends StatelessWidget {
  const BookingFailed({Key? key}) : super(key: key);

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
                      'assets/lottie/error_confirm_dialogue.json'),
                ),
                Text('Failed :(', style: titleText,),
                MarginHeight(height: 10),
                Text(
                  'There is error has occurred, try again next time!',
                  style: regularText,
                  textAlign: TextAlign.center,
                ),
                MarginHeight(height: 15),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.bodyScreen, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: greenDarkerColor),
                    child: Text('Back to Main Menu', style: regularText,),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
