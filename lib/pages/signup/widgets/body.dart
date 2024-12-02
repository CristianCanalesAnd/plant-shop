import 'package:flutter/material.dart';
import 'package:plant_shop/pages/signup/widgets/welcome_label.dart';
import 'package:plant_shop/widgets/app_logo.dart';

import 'signup_form.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppLogo(),
            SizedBox(height: 20),
            WelcomeLabel(),
            SizedBox(height: 25),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
