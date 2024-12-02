import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/widgets/quantity_controls.dart';

import 'add_to_cart_button.dart';

class AddToCartContainer extends StatelessWidget {
  final int quantity;
  final int price;
  final Function() addItem;
  final Function() removeItem;
  final Function() onAddToCartPressed;

  const AddToCartContainer({
    super.key,
    required this.quantity,
    required this.price,
    required this.addItem,
    required this.removeItem,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildPriceAndQuantityControls(),
        const SizedBox(height: 20),
        AddToCartButton(
          quantity: quantity,
          price: price,
          onPressed: onAddToCartPressed,
        ),
      ],
    );
  }

  Widget buildPriceAndQuantityControls() {
    return Row(
      children: [
        buildPriceLabel(),
        const Spacer(),
        QuantityControls(
          quantity: quantity,
          addItem: addItem,
          removeItem: removeItem,
        )
      ],
    );
  }

  Widget buildPriceLabel() {
    return Text(
      "\$$price",
      style: AppTextStyle.bold(fontSize: 28),
    );
  }
}
