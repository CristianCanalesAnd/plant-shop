import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class TermsAndCoditions extends StatelessWidget {
  final bool checkboxValue;
  final Function(bool)? onPressed;

  const TermsAndCoditions({
    super.key,
    required this.checkboxValue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(!checkboxValue),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: checkboxValue,
            onChanged: (_) {},
            activeColor: AppColors.primary500,
          ),
          const SizedBox(width: 10),
          buildLabel(),
        ],
      ),
    );
  }

  Widget buildLabel() {
    return Flexible(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'I agree to the ',
              style: AppTextStyle.regular(
                color: AppColors.dark,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: 'Terms & Conditions & Privacy Policy ',
              style: AppTextStyle.regular(
                color: AppColors.primary500,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: 'set out by this site',
              style: AppTextStyle.regular(
                color: AppColors.dark,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
