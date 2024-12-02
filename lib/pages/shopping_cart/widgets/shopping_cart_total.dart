import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/widgets/custom_button.dart';

class ShoppingCartTotal extends StatefulWidget {
  final int itemTotal;
  final Function() onProceedToCheckoutPressed;

  const ShoppingCartTotal({
    super.key,
    required this.itemTotal,
    required this.onProceedToCheckoutPressed,
  });

  @override
  State<ShoppingCartTotal> createState() => _ShoppingCartTotalState();
}

class _ShoppingCartTotalState extends State<ShoppingCartTotal> {
  double shippingCharge = 3;
  int get itemTotal => widget.itemTotal;
  double get total => itemTotal + shippingCharge;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 10),
        buildItemTotal(),
        const SizedBox(height: 10),
        buildShippingCharge(),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        buildGranTotal(),
        const SizedBox(height: 25),
        buildCheckoutButton()
      ],
    );
  }

  Widget buildItemTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Item Total',
          style: AppTextStyle.regular(
            color: AppColors.dark,
            fontSize: 18,
          ),
        ),
        Text(
          '\$$itemTotal',
          style: AppTextStyle.regular(
            color: AppColors.dark,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildShippingCharge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shipping Charge',
          style: AppTextStyle.regular(
            color: AppColors.dark,
            fontSize: 18,
          ),
        ),
        Text(
          '\$$shippingCharge',
          style: AppTextStyle.regular(
            color: AppColors.dark,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildGranTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Grand Total',
          style: AppTextStyle.bold(
            color: AppColors.dark,
            fontSize: 22,
          ),
        ),
        Text(
          '\$$total',
          style: AppTextStyle.bold(
            color: AppColors.dark,
            fontSize: 22,
          ),
        ),
      ],
    );
  }

  Widget buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'Proceed to Checkout',
        onPressed: widget.onProceedToCheckoutPressed,
      ),
    );
  }
}
