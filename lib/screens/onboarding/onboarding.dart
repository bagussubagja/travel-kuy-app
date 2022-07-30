import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/shared/theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      totalPage: 3,
      finishButtonText: 'Lets Get Started',
      headerBackgroundColor: blackBackgroundColor,
      pageBackgroundColor: blackBackgroundColor,
      controllerColor: greenDarkerColor,
      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          color: greyColor,
          fontSize: 18.0,
        ),
      ),
      finishButtonColor: greenDarkerColor,
      onFinish: () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginScreen, (route) => false);
      },
      background: [
        Image.asset(
          'assets/images/onboard1.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/onboard2.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/onboard3.png',
          height: 400,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'On your way...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'to find the perfect looking Onboarding for your app?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'You’ve reached your destination.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sliding with animation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Where everything is possible and customize your onboarding.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
