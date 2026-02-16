import '../../features/authentication/pages/login_screen.dart';
import '../../features/onboarding/pages/onboarding_screen.dart';
import '../../features/onboarding/pages/splash_screen.dart';

final routes = {
  SplashScreen.route: (context) => const SplashScreen(),
  OnboardingScreen.route: (context) => const OnboardingScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
};
