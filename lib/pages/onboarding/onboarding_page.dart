import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';

import 'widgets/body.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Body(),
    );
  }
}
