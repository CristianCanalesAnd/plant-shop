import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class SignUpButton extends StatelessWidget {
  final Function() onPressed;

  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: AppTextStyle.regular(
            color: AppColors.dark,
            fontSize: 15,
          ),
          children: [
            TextSpan(
              text: "Register",
              style: AppTextStyle.regular(
                color: AppColors.primary500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
