import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class AddToCartButton extends StatelessWidget {
  final int quantity;
  final int price;
  final Function() onPressed;

  const AddToCartButton({
    super.key,
    required this.quantity,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primary500,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            buildIcon(),
            const SizedBox(width: 10),
            buildAddToCartLabel(),
            const Spacer(),
            buildSeparatorLabel(),
            const Spacer(),
            buildTotalPriceLabel(),
          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Image.asset(
      "assets/images/nav/shopping-cart.png",
      width: 34,
    );
  }

  Widget buildAddToCartLabel() {
    return Text(
      'Add to Cart',
      style: AppTextStyle.bold(
        fontSize: 22,
        color: Colors.white,
      ),
    );
  }

  Widget buildSeparatorLabel() {
    return Text(
      '|',
      style: AppTextStyle.semiBold(
        fontSize: 22,
        color: Colors.white,
      ),
    );
  }

  Widget buildTotalPriceLabel() {
    int totalPrice = quantity * price;
    return SizedBox(
      width: 100,
      child: Center(
        child: Text(
          "\$${totalPrice.toStringAsFixed(2)}",
          style: AppTextStyle.bold(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
