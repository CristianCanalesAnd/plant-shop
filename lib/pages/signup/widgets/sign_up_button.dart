import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/custom_button.dart';

class SignUpButton extends StatelessWidget {
  final Function() onPressed;

  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'Register',
        onPressed: onPressed,
      ),
    );
  }
}
