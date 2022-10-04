import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cache_manager/cache_manager.dart';
import 'package:travel_kuy_app/shared/theme.dart';

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
          Navigator.of(context).pushNamed(AppRoutes.onboardingScreen);
        },
        actionIfNotNull: () {
          Navigator.of(context).pushNamed(AppRoutes.bodyScreen);
        });
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), initiateCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
