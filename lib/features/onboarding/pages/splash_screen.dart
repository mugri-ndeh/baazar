import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/theme/app_colors.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const route = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: 32).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    if (mounted) {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        if (!mounted) return;
        Navigator.pushNamed(context, OnboardingScreen.route);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Row(
          spacing: 4.w,
          mainAxisAlignment: .center,
          children: [
            Transform.rotate(
              angle: pi * _controller.value,
              child: SizedBox(
                height: 38.h,
                width: 38.h,
                child: Assets.images.logo.image(),
              ),
            ),
            Text(
              'Bazar.',
              style: TextStyle(
                fontSize: _animation.value.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
