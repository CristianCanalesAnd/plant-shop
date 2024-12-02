import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'plant_widget.dart';

class MyFavorite extends StatefulWidget {
  final Function(GroupPlant) onPlantPressed;
  final Function(List<GroupPlant>) onViewAllPressed;

  const MyFavorite({
    super.key,
    required this.onPlantPressed,
    required this.onViewAllPressed,
  });

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        var groupPlants = state.favorites;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(groupPlants),
            const SizedBox(height: 20),
            buildItems(groupPlants.take(5).toList()),
          ],
        );
      },
    );
  }

  Widget buildHeader(List<GroupPlant> groupPlants) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTitleLabel(),
        buildViewAllLabel(groupPlants),
      ],
    );
  }

  Widget buildTitleLabel() {
    return Text(
      "My Favorite",
      style: AppTextStyle.bold(
        color: AppColors.dark,
        fontSize: 18,
      ),
    );
  }

  Widget buildViewAllLabel(List<GroupPlant> plants) {
    return GestureDetector(
      onTap: () => widget.onViewAllPressed(plants),
      child: Text(
        "View All",
        style: AppTextStyle.regular(
          color: AppColors.primary500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildItems(List<GroupPlant> plants) {
    return Column(
      children: plants
          .map(
            (plant) => PlantWidget(
              plant: plant,
              onPressed: () => widget.onPlantPressed(plant),
            ),
          )
          .toList(),
    );
  }
}
