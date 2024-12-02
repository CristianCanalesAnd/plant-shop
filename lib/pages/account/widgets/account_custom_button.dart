import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class AccountCustomButton extends StatelessWidget {
  final String title;
  final String image;
  final Function() onPressed;

  const AccountCustomButton({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.dark.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            buildIcon(),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyle.semiBold(
                color: AppColors.dark,
              ),
            ),
            const Spacer(),
            buildArrowRight()
          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    double size = 20;
    return Image.asset(
      image,
      color: AppColors.dark,
      width: size,
    );
  }

  Widget buildArrowRight() {
    double size = 20;
    return Image.asset(
      'assets/images/common/chevron_right.png',
      width: size,
    );
  }
}
