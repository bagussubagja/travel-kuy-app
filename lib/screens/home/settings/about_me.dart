import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: LottieBuilder.asset('assets/lottie/login.json'),
              ),
              MarginHeight(height: 20),
              Center(
                child: Text(
                  'Hello There! ❤️',
                  style: titleText,
                ),
              ),
              MarginHeight(height: 20),
              Text(
                "Hello! I’m Bagus Subagja a student from Indonesia University of Education (UPI) at Software Engineering majority. I created Travel-Kuy App Mobile to introduce so many beatiful Indonesia place to visit!.",
                style: regularText,
                textAlign: TextAlign.center,
              ),
              MarginHeight(height: 40),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Linkedin : Bagus Subagja',
                      style: regularText,
                    ),
                    Text(
                      'Github : github.com/bagussubagja',
                      style: regularText,
                    ),
                  ],
                ),
              ),
              MarginHeight(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: greenDarkerColor),
                  child: Text(
                    'Back to Menu',
                    style: regularText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
