import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/widgets/custom_button.dart';

class ShoppingCartEmpty extends StatelessWidget {
  const ShoppingCartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/common/shopping_cart_empty.png',
            color: AppColors.dark,
            width: 200,
          ),
          const SizedBox(height: 40),
          Text(
            'Your shopping cart is empty',
            style: AppTextStyle.regular(
              color: AppColors.gray,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Fortunately, we have a lot of plants!',
            style: AppTextStyle.bold(
              color: AppColors.dark,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              title: 'Go Shopping',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
