import 'package:travel_kuy_app/screens/authentication/biodata_screen.dart';
import 'package:travel_kuy_app/screens/authentication/login_screen.dart';
import 'package:travel_kuy_app/screens/authentication/register_screen.dart';
import 'package:travel_kuy_app/screens/details/confirmation_stepper_screen.dart';
import 'package:travel_kuy_app/screens/details/widgets/booking_process.dart';
import 'package:travel_kuy_app/screens/details/detail_screen.dart';
import 'package:travel_kuy_app/screens/home/body_screen.dart';
import 'package:travel_kuy_app/screens/onboarding/onboarding_screen.dart';
import 'package:travel_kuy_app/screens/state_ui.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboard';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String stateUI = '/state';
  static const String bodyScreen = '/home';
  static const String detailScreen = '/detail';
  static const String bookingProcess = '/bprocess';
  static const String categoryPage = '/category';
  static const String biodataPage = '/biodata';
  static const String confirmPage = '/confirm';

  static final routes = {
    onboardingScreen: (context) => const OnboardingPage(),
    loginScreen: (context) => const LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    bodyScreen: (context) => BodyScreen(),
    detailScreen: (context) => DetailScreen(),
    stateUI: (context) => const StateUI(),
    biodataPage: (context) => BiodataUser(),
    confirmPage: (context) => ConfirmationStepperScreen()
  };
}
