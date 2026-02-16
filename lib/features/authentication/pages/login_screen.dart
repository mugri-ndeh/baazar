import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String route = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _headerAnimation;
  late Animation<double> _formAnimation;
  late Animation<double> _forgotPasswordAnimation;
  late Animation<double> _buttonAnimation;
  late Animation<double> _footerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _headerAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut));
    _formAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOut));
    _forgotPasswordAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeOut));
    _buttonAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.9, curve: Curves.easeOut));
    _footerAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedWidget(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnimatedWidget(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back 👋',
                    style: TextStyle(
                      fontWeight: .bold,
                      fontFamily: FontFamily.openSans,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Sign to your account',
                    style: TextStyle(
                      color: AppColors.gray500,
                      fontSize: 16.sp,
                      fontFamily: FontFamily.roboto,
                    ),
                  ),
                ],
              ),
              _headerAnimation,
            ),
            SizedBox(height: 24.h),
            _buildAnimatedWidget(
              Column(
                children: [
                  InputField(
                    onChanged: (String p1) {},
                    labelText: 'Email',
                    hintText: 'Your Email',
                  ),
                  SizedBox(height: 16.h),
                  InputField(
                    onChanged: (String p1) {},
                    labelText: 'Password',
                    hintText: 'Your password',
                    isPassword: true,
                  ),
                ],
              ),
              _formAnimation,
            ),
            SizedBox(height: 16.h),
            _buildAnimatedWidget(
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: .w600,
                  fontFamily: FontFamily.roboto,
                ),
              ),
              _forgotPasswordAnimation,
            ),
            SizedBox(height: 24.h),
            _buildAnimatedWidget(
              ElevatedButton(onPressed: () {}, child: const Text('Login')),
              _buttonAnimation,
            ),
            SizedBox(height: 24.h),
            _buildAnimatedWidget(
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: 'Don’t have an account? '),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                    style:
                        TextStyle(color: AppColors.gray500, fontSize: 16.sp),
                  ),
                ),
              ),
              _footerAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
