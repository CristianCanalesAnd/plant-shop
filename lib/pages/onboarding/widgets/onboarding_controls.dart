import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/widgets/custom_button.dart';

class OnboardingControls extends StatelessWidget {
  final bool isLastPage;
  final Function() onSkipPressed;
  final Function() onNextPressed;

  const OnboardingControls({
    super.key,
    required this.isLastPage,
    required this.onSkipPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (isLastPage) {
      return SizedBox(
        width: double.infinity,
        child: CustomButton(
          title: 'Get Started',
          onPressed: onNextPressed,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkipPressed,
          child: Text(
            'Skip',
            style: AppTextStyle.regular(color: AppColors.dark, fontSize: 16),
          ),
        ),
        CustomButton(
          title: 'Next',
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          onPressed: onNextPressed,
        )
      ],
    );
  }
}
