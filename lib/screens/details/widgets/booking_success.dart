// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/services/local_notification_service/local_notification_service.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class BookingSuccess extends StatefulWidget {
  String placeName;
  BookingSuccess({Key? key, required this.placeName}) : super(key: key);

  @override
  State<BookingSuccess> createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
  late final LocalNotificationService service;
  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

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
                  'You have successfully booked "${widget.placeName}" as your next vacation destination, have fun!',
                  style: regularText,
                  textAlign: TextAlign.center,
                ),
                MarginHeight(height: 15),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await service.showNotification(
                          id: 0,
                          title: "Enjoy your vacation in Indonesia!",
                          body: "You have choose ${widget.placeName} as your destination 😉");
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.bodyScreen, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greenDarkerColor),
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
