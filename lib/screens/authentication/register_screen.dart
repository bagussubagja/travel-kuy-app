import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/routes/routes.dart';

import '../../shared/theme.dart';
import '../../widgets/my_textfield.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: blackBackgroundColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey, welcome! 👋',
                  style: titleText,
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Ready to explore the beauty of the world?",
                  style: subTitleText,
                ),
                Center(
                  child: LottieBuilder.asset('assets/lottie/register.json'),
                ),
                MyTextField(
                  titleText: 'E-Mail',
                  hintText: 'Enter your email....',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  titleText: 'Password',
                  hintText: 'Enter your password....',
                  controller: passwordController,
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Already have an account?",
                      style: regularText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                        child: Text(
                          'Login Now!',
                          style: regularText.copyWith(color: greenDarkerColor),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Timer(const Duration(seconds: 3), () => print('object'));
                    },
                    style: ElevatedButton.styleFrom(primary: greenDarkerColor),
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Divider(
                        color: greyColor,
                        height: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'or Sign up With',
                      style: regularText,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Divider(
                        color: greyColor,
                        height: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          primary: greenDarkerColor,
                          side: BorderSide(width: 1.0, color: greenDarkerColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/google-logo.png',
                              height: 20,
                            ),
                            const Text('Sign up with Google')
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
