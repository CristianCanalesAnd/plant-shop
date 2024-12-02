import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class QuantityControls extends StatelessWidget {
  final int quantity;
  final Function() addItem;
  final Function() removeItem;

  const QuantityControls({
    super.key,
    required this.quantity,
    required this.addItem,
    required this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: .5,
          color: AppColors.gray,
        ),
      ),
      child: Row(
        children: [
          buildQuantityControl(
            image: "assets/images/common/minus.png",
            onTap: removeItem,
          ),
          Container(
            width: 40,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: .5,
                  color: AppColors.gray,
                ),
                right: BorderSide(
                  width: .5,
                  color: AppColors.gray,
                ),
              ),
            ),
            child: Center(
              child: Text(
                '$quantity',
                style: AppTextStyle.regular(fontSize: 22),
              ),
            ),
          ),
          buildQuantityControl(
            image: "assets/images/common/add.png",
            onTap: addItem,
          ),
        ],
      ),
    );
  }

  Widget buildQuantityControl({
    required String image,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Image.asset(
          image,
          width: 30,
        ),
      ),
    );
  }
}
