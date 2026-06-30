import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/local/app_shared_pref.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (AppSharedPreference.getOnBoardingState()) {
        context.go(Routes.home);
      } else {
        context.go(Routes.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(height: 30),
        const Icon(
          Icons.laptop_mac,
          size: 200,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: SizedBox(
            width: 120,
            child: LinearProgressIndicator(
              color: Colors.black,
            ),
          ),
        )
      ],
    ));
  }
}
