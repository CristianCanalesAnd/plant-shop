import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTitle(),
      ],
    );
  }

  Widget buildTitle() {
    return Text(
      'Forgot password',
      style: AppTextStyle.bold(
        fontSize: 34,
      ),
    );
  }
}
