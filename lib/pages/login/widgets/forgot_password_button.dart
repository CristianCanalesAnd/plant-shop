import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class ForgotPasswordButton extends StatelessWidget {
  final Function() onPressed;

  const ForgotPasswordButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Text(
            'Forgot Password ?',
            style: AppTextStyle.regular(
              color: AppColors.primary500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
