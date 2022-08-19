import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/screens/details/booking_success.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class BookingProcess extends StatefulWidget {
  const BookingProcess({Key? key}) : super(key: key);

  @override
  State<BookingProcess> createState() => _BookingProcessState();
}

class _BookingProcessState extends State<BookingProcess> {
  Future<bool> getLoadingDone() async {
    await Future.delayed(const Duration(seconds: 4));
    return true;
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BookingSuccess()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
        child: FutureBuilder<bool?>(
            future: getLoadingDone(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool data = snapshot.data!;
                return Center(
                    child: Container(
                        height: 100,
                        width: 100,
                        child: LottieBuilder.asset(
                            'assets/lottie/success_action.json')));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
