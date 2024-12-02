import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class Specifications extends StatelessWidget {
  const Specifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSpecification(
          title: 'Size',
          value: 'Medium',
        ),
        buildSpecification(
          title: 'Plant',
          value: 'Orchid',
        ),
        buildSpecification(
          title: 'Height',
          value: "10.5''",
        ),
        buildSpecification(
          title: 'Humidity',
          value: '80%',
        ),
      ],
    );
  }

  Widget buildSpecification({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.regular(
            color: AppColors.gray,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: AppTextStyle.bold(
            color: AppColors.dark,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
