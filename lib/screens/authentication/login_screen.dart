import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: blackBackgroundColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Again! 👋',
                  style: titleText,
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Let's explore the beautiful world again with us!",
                  style: subTitleText,
                ),
                Center(
                  child: LottieBuilder.asset('assets/lottie/login.json'),
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
                      "Don't have an account yet?",
                      style: regularText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.registerScreen);
                        },
                        child: Text(
                          'Register Now!',
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.bodyScreen, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(primary: greenDarkerColor),
                    child: const Text('Login'),
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
                      'or Sign in With',
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
                            const Text('Sign in with Google')
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
