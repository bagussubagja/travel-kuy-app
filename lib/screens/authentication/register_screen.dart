import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/screens/authentication/biodata_screen.dart';

import '../../core/auth_notifier/auth_notifier.dart';
import '../../shared/theme.dart';
import '../../widgets/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    onPressed: () async {
                      String email = emailController.text;
                      String password = passwordController.text;
                      if (email.isNotEmpty && password.isNotEmpty) {
                        await authenticationNotifier.signUp(
                            email: email, password: password, context: context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Fill the TextField!')));
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: greenDarkerColor),
                    child: Text(
                      'Register',
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
