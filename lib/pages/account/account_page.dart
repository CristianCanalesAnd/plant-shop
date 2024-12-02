import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'widgets/body.dart';

@RoutePage(name: 'AccountTab')
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
        'Account',
        style: AppTextStyle.bold(
          color: AppColors.dark,
          fontSize: 28,
        ),
      ),
      centerTitle: false,
    );
  }
}
