import '../../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Assets.icons.home.svg(
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? AppColors.primary : AppColors.gray500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.document.svg(
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? AppColors.primary : AppColors.gray500,
              BlendMode.srcIn,
            ),
          ),
          label: 'About',
        ),
      ],
    );
  }
}
