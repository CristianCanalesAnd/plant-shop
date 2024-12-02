import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/models/card.dart' as model;

class CardWidget extends StatelessWidget {
  final model.Card card;
  final bool isActive;
  final Function() onPressed;

  const CardWidget({
    super.key,
    required this.card,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
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
            Image.asset(
              card.type.image,
              height: 40,
            ),
            const SizedBox(width: 10),
            Text(
              card.cardNumber,
              style: AppTextStyle.regular(
                color: AppColors.dark,
                fontSize: 16,
              ),
              maxLines: 2,
            ),
            const Spacer(),
            buildRadio(),
          ],
        ),
      ),
    );
  }

  Widget buildRadio() {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary500 : AppColors.gray5Percent,
        shape: BoxShape.circle,
      ),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary500 : AppColors.white,
          shape: BoxShape.circle,
          border: const Border.fromBorderSide(
            BorderSide(
              color: AppColors.white,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
