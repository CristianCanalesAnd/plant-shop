import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'widgets/body.dart';

@RoutePage()
class ShowAllPage extends StatelessWidget {
  final List<GroupPlant> plants;

  const ShowAllPage({
    super.key,
    required this.plants,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray10Percent,
      appBar: buildAppBar(),
      body: Body(plants: plants),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.gray10Percent,
      title: Text(
        "Show All",
        style: AppTextStyle.bold(
          fontSize: 28,
          color: Colors.black,
        ),
      ),
    );
  }
}
