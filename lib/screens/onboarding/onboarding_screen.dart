

import 'package:flutter/material.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onBoardScreen(context),
    );
  }

  Widget onBoardScreen(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/1.png',
          fit: BoxFit.cover,
        ),
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.0),
                Colors.black,
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        Padding(
          padding: defaultPadding,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore Indonesia with us!',
                  style: titleText.copyWith(fontSize: 24),
                ),
                MarginHeight(height: 10),
                Text(
                  'Travel-kuy App are ready to help you find amazing places for your next vacation around Indonesia',
                  style: regularText,
                  textAlign: TextAlign.center,
                ),
                MarginHeight(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.registerScreen, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenDarkerColor,
                  ),
                  child: Text(
                    "Let's Get Started!",
                    style: regularText,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: regularText.copyWith(color: greyColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.loginScreen, (route) => false);
                        },
                        child: Text(
                          'Login Now!',
                          style: regularText.copyWith(color: greenDarkerColor),
                        )),
                  ],
                ),
                MarginHeight(height: 55)
              ],
            ),
          ),
        )
      ],
    );
  }
}
