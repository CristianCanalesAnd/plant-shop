import 'package:flutter/material.dart';
import 'package:plant_shop/models/address.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class AddressWidget extends StatelessWidget {
  final Address address;
  final bool isActive;
  final Function() onPressed;

  const AddressWidget({
    super.key,
    required this.address,
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
        height: 120,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRadio(),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.title,
                    style: AppTextStyle.bold(
                      color: AppColors.dark,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      address.address,
                      style: AppTextStyle.regular(
                        color: AppColors.dark,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/common/more.png',
              height: 24,
            ),
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
