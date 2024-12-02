import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';

class OnboardingDots extends StatelessWidget {
  final int dotsLength;
  final int indexSelected;
  final double size;
  final Function(int) onDotPressed;

  const OnboardingDots({
    super.key,
    required this.dotsLength,
    required this.indexSelected,
    this.size = 12,
    required this.onDotPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotsLength,
        (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    Color color =
        indexSelected == index ? AppColors.primary500 : AppColors.gray20Percent;
    return GestureDetector(
      onTap: () => onDotPressed(index),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          height: size,
          width: size,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
