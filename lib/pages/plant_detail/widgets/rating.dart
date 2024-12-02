import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildRating(),
        const SizedBox(width: 5),
        buildReviewLabel(),
      ],
    );
  }

  Widget buildRating() {
    int rating = 4;
    int maxRating = 5;

    return Row(
      children: [
        Row(
          children: List.generate(
            maxRating,
            (index) => buildStar(index < rating),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '$rating',
          style: AppTextStyle.regular(fontSize: 23),
        )
      ],
    );
  }

  Widget buildStar(bool isActive) {
    double size = 25;

    return Image.asset(
      isActive
          ? 'assets/images/common/star.png'
          : 'assets/images/common/star_empty.png',
      height: size,
      width: size,
    );
  }

  Widget buildReviewLabel() {
    return Text(
      '(146 Reviews)',
      style: AppTextStyle.regular(fontSize: 22),
    );
  }
}
