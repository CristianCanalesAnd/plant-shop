import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'plant_widget.dart';

class MostPopular extends StatefulWidget {
  final Function(GroupPlant) onPlantPressed;
  final Function(List<GroupPlant>) onViewAllPressed;

  const MostPopular({
    super.key,
    required this.onPlantPressed,
    required this.onViewAllPressed,
  });

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        var groupPlants = state.groupPlants;
        return Column(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitleLabel(),
          buildViewAllLabel(groupPlants),
        ],
      ),
    );
  }

  Widget buildTitleLabel() {
    return Text(
      "Most Popular",
      style: AppTextStyle.bold(
        color: AppColors.dark,
        fontSize: 18,
      ),
    );
  }

  Widget buildViewAllLabel(List<GroupPlant> groupPlants) {
    return GestureDetector(
      onTap: () => widget.onViewAllPressed(groupPlants),
      child: Text(
        "View All",
        style: AppTextStyle.regular(
          color: AppColors.primary500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildItems(List<GroupPlant> groupPlants) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        groupPlants.length,
        (index) {
          GroupPlant plant = groupPlants[index];
          bool isFirstItem = index == 0;
          return Padding(
            padding: EdgeInsets.only(left: isFirstItem ? 20 : 0),
            child: PlantWidget(
              plant: plant,
              onPressed: () => widget.onPlantPressed(plant),
            ),
          );
        },
      )),
    );
  }
}
