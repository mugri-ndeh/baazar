import 'package:baazar/features/onboarding/pages/splash_screen.dart';
import 'package:baazar/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/navigation/app_routes.dart';
import 'shared/navigation/route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          routes: routes,
          navigatorKey: navigatorKey,
          initialRoute: SplashScreen.route,
          onGenerateRoute: onGenerateRoute,
        );
      },
    );
  }
}
