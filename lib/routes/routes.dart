import 'package:travel_kuy_app/screens/authentication/login_screen.dart';
import 'package:travel_kuy_app/screens/authentication/register_screen.dart';
import 'package:travel_kuy_app/screens/home/body_screen.dart';
import 'package:travel_kuy_app/screens/onboarding/onboarding.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboard';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String bodyScreen = '/home';

  static final routes = {
    onboardingScreen: (context) => const OnboardingScreen(),
    loginScreen: (context) => const LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    bodyScreen: (context) => const BodyScreen()
  };
}
