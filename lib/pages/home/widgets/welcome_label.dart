import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class WelcomeLabel extends StatelessWidget {
  const WelcomeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Good morning 👋\n",
            style: AppTextStyle.bold(
              color: AppColors.dark,
              fontSize: 28,
            ),
          ),
          TextSpan(
            text: "Find Your Favorite Plants Here",
            style: AppTextStyle.regular(
              color: AppColors.dark,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
