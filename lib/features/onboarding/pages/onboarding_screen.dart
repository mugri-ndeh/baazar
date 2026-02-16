import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
import '../../../shared/theme/app_colors.dart';
import '../../authentication/pages/login_screen.dart';
import '../cubit/onboarding_cubit.dart';
import '../widgets/onboard_dot.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const route = '/onboaring-screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _skipAnimation;
  late Animation<double> _imageAnimation;
  late Animation<double> _titleAnimation;
  late Animation<double> _subtitleAnimation;
  late Animation<double> _dotsAnimation;
  late Animation<double> _buttonsAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _skipAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeOut));
    _imageAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.elasticOut));
    _titleAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.7, curve: Curves.elasticOut));
    _subtitleAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.elasticOut));
    _dotsAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.9, curve: Curves.easeOut));
    _buttonsAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 27.w),
          child: BlocBuilder<OnboardingCubit, int>(
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();
              final data = cubit.data[state];
              return Column(
                crossAxisAlignment: .start,
                children: [
                  FadeTransition(
                    opacity: _skipAnimation,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, LoginScreen.route),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontFamily: FontFamily.openSans,
                          color: AppColors.primary,
                          fontWeight: .w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ScaleTransition(
                    scale: _imageAnimation,
                    child: FadeTransition(
                      opacity: _imageAnimation,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Container(
                          key: ValueKey<String>(data.imagePath),
                          height: 320.h,
                          width: double.infinity,
                          child: Image.asset(data.imagePath, fit: .cover),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  ScaleTransition(
                    scale: _titleAnimation,
                    child: FadeTransition(
                      opacity: _titleAnimation,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Center(
                          key: ValueKey<String>(data.title),
                          child: Text(
                            data.title,
                            style: TextStyle(
                              fontFamily: FontFamily.openSans,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: .center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.h),
                  ScaleTransition(
                    scale: _subtitleAnimation,
                    child: FadeTransition(
                      opacity: _subtitleAnimation,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Center(
                          key: ValueKey<String>(data.subtitle),
                          child: Text(
                            data.subtitle,
                            style: TextStyle(
                              fontFamily: FontFamily.roboto,
                              fontSize: 16.sp,
                              color: AppColors.gray500,
                            ),
                            textAlign: .center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  FadeTransition(
                    opacity: _dotsAnimation,
                    child: Row(
                      mainAxisAlignment: .center,
                      spacing: 2.w,
                      children: List.generate(3, (index) {
                        return OnboardDot(isActive: index == state);
                      }),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  FadeTransition(
                    opacity: _buttonsAnimation,
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(.infinity, 56.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                          ),
                          onPressed: () {
                            state == 2
                                ? Navigator.pushNamed(
                                    context, LoginScreen.route)
                                : cubit.onChanged(state + 1);
                          },
                          child: Text(state == 2 ? "Get Started" : "Continue"),
                        ),
                        SizedBox(height: 8.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.primary50,
                            maximumSize: Size(.infinity, 56.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.route);
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
