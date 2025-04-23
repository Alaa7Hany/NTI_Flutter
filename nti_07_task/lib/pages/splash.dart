import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_06_task/pages/on_boarding.dart';
import 'dart:async';
import 'package:nti_06_task/utils/app_assets.dart';
import 'package:nti_06_task/utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(child: SvgPicture.asset(AppAssets.splash, fit: BoxFit.fill)),
    );
  }
}
