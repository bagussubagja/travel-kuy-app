import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/my_textfield.dart';

import '../../core/auth_notifier/auth_notifier.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
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
                  obscureText: _isObscure,
                  isObscure: _isObscure,
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: greyColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: regularText.copyWith(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.registerScreen,
                          );
                        },
                        child: Text(
                          'Register Now!',
                          style: regularText.copyWith(
                              color: greenDarkerColor, fontSize: 16),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      String email = emailController.text;
                      String password = passwordController.text;
                      if (email.isNotEmpty && password.isNotEmpty) {
                        await authenticationNotifier.login(
                            email: email, password: password, context: context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Fill the TextField!')));
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: greenDarkerColor),
                    child: Text(
                      'Login',
                      style: regularText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
