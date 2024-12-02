import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';

class NavButton extends StatelessWidget {
  final String image;
  final double size;
  final Function() onTap;

  const NavButton({
    super.key,
    required this.image,
    this.size = 36,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        color: AppColors.dark,
        image,
        height: size,
        width: size,
      ),
    );
  }
}
