import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cache_manager/cache_manager.dart';
import 'package:travel_kuy_app/shared/theme.dart';
import 'package:travel_kuy_app/widgets/margin_widget_height.dart';

import '../routes/routes.dart';

class StateUI extends StatefulWidget {
  const StateUI({Key? key}) : super(key: key);

  @override
  State<StateUI> createState() => _StateUIState();
}

class _StateUIState extends State<StateUI> {
  Future initiateCache() async {
    return CacheManagerUtils.conditionalCache(
        key: "cache",
        valueType: ValueType.StringValue,
        actionIfNull: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.onboardingScreen, (route) => false);
        },
        actionIfNotNull: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.bodyScreen, (route) => false);
        });
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 4), initiateCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/images/app-logo.png'),
            ),
            MarginHeight(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
