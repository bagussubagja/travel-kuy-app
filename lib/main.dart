import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/providers/providers_list.dart';
import 'package:travel_kuy_app/routes/routes.dart';
import 'package:travel_kuy_app/shared/theme.dart';

void main() {
  runApp(const TravelKuy());
}

class TravelKuy extends StatelessWidget {
  const TravelKuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: ProvidersList.providers, child: const TravelKuyApp());
  }
}

class TravelKuyApp extends StatelessWidget {
  const TravelKuyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Kuy App',
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Poppins',
          textTheme: TextTheme(headline6: TextStyle(color: whiteColor))),
      initialRoute: AppRoutes.stateUI,
      routes: AppRoutes.routes,
    );
  }
}
