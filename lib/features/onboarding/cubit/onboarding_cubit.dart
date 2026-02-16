import 'package:bloc/bloc.dart';
import '../../../gen/assets.gen.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);
  List<OnboardingData> data = [
    OnboardingData(
      imagePath: Assets.images.onboardStep1.path,
      title: 'Now reading books\nwill be easier',
      subtitle:
          'Discover new worlds, join a vibrant\nreading community. Start your reading\nadventure effortlessly with us.',
    ),
    OnboardingData(
      imagePath: Assets.images.onboardStep2.path,
      title: 'Your Bookish Soulmate\nAwaits',
      subtitle:
          'Let us be your guide to the perfect read.\nDiscover books tailored to your tastes\nfor a truly rewarding experience.',
    ),
    OnboardingData(
      imagePath: Assets.images.onboardStep3.path,
      title: 'Start Your Adventure',
      subtitle:
          "Ready to embark on a quest for\ninspiration and knowledge? Your\nadventure begins now. Let's go!",
    ),
  ];

  void onChanged(int index) {
    emit(index);
  }
}

class OnboardingData {
  final String imagePath;
  final String title;
  final String subtitle;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}
