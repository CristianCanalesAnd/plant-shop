import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';

import 'plant_widget.dart';

class FilteredPlants extends StatefulWidget {
  final String searchName;
  final Function(GroupPlant) onPlantPressed;

  const FilteredPlants({
    super.key,
    required this.searchName,
    required this.onPlantPressed,
  });

  @override
  State<FilteredPlants> createState() => _FilteredPlantsState();
}

class _FilteredPlantsState extends State<FilteredPlants> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        final searchName = widget.searchName.toLowerCase();
        final groupPlants = state.groupPlants
            .where((e) => e.name.toLowerCase().contains(searchName))
            .toList();

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            buildItems(groupPlants),
          ],
        );
      },
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
