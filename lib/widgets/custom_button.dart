import 'package:flutter/material.dart';
import 'package:plant_shop/theme/button_theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  final Function() onPressed;

  const CustomButton({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: BtnTheme.primaryBtn(padding: padding),
      child: Text(title),
    );
  }
}
