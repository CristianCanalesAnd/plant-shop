import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';

import 'widgets/body.dart';

@RoutePage(name: 'HomeTab')
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        backgroundColor: AppColors.gray10Percent,
        body: Body(),
      ),
    );
  }
}
