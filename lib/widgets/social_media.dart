import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/widgets/social_card.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildDescription(),
        const SizedBox(height: 20),
        buildSocial(),
      ],
    );
  }

  Widget buildDescription() {
    return Text(
      'Or continue with social account',
      style: AppTextStyle.regular(
        color: AppColors.gray,
        fontSize: 15,
      ),
    );
  }

  Widget buildSocial() {
    return Row(
      children: [
        Expanded(
          child: SocialCard(
            title: "Google",
            image: "assets/images/social_media/google.png",
            onPressed: () {
              print("Login with Google");
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SocialCard(
            title: "Facebook",
            image: "assets/images/social_media/facebook.png",
            onPressed: () {
              print("Login with Facebook");
            },
          ),
        ),
      ],
    );
  }
}
