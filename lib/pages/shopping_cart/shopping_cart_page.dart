import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'widgets/body.dart';

@RoutePage(name: 'ShoppingCartTab')
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray10Percent,
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.gray10Percent,
      title: Text(
        'Shopping Cart',
        style: AppTextStyle.bold(
          color: AppColors.dark,
          fontSize: 28,
        ),
      ),
      centerTitle: false,
    );
  }
}
