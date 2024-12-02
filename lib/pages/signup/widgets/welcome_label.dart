import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class WelcomeLabel extends StatelessWidget {
  const WelcomeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(),
        const SizedBox(height: 5),
        buildSubtitle(),
      ],
    );
  }

  Widget buildTitle() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Welcome Back 👋\n",
            style: AppTextStyle.bold(
              color: AppColors.dark,
              fontSize: 28,
            ),
          ),
          TextSpan(
            text: "to ",
            style: AppTextStyle.bold(
              color: AppColors.dark,
              fontSize: 28,
            ),
          ),
          TextSpan(
            text: "PLANT",
            style: AppTextStyle.bold(
              color: AppColors.primary500,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSubtitle() {
    return Text(
      "Hello there, login to continue",
      style: AppTextStyle.regular(
        color: AppColors.gray,
        fontSize: 14,
      ),
    );
  }
}
