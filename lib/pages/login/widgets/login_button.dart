import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/custom_button.dart';

class LoginButton extends StatelessWidget {
  final Function() onPressed;

  const LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'LOGIN',
        onPressed: onPressed,
      ),
    );
  }
}
