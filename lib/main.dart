import 'package:flutter/material.dart';
import 'package:travel_kuy_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Kuy App',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
      initialRoute: AppRoutes.bodyScreen,
      routes: AppRoutes.routes,

    );
  }
}
