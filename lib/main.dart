import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_kuy_app/providers/auth_provider.dart';
import 'package:travel_kuy_app/routes/routes.dart';

void main() {
  runApp(const TravelKuy());
}

class TravelKuy extends StatelessWidget {
  const TravelKuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: AppProviders.providers, child: const TravelKuyApp());
  }
}


class TravelKuyApp extends StatelessWidget {
  const TravelKuyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Kuy App',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
      initialRoute: AppRoutes.stateUI,
      routes: AppRoutes.routes,
    );
  }
}
