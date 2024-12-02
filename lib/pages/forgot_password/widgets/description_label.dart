import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class DescriptionLabel extends StatelessWidget {
  const DescriptionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please enter your email address. You will receive a link to create a new password via email.',
      style: AppTextStyle.regular(
        fontSize: 15,
        color: AppColors.dark,
      ),
    );
  }
}
