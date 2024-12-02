import 'package:flutter/material.dart';
import 'package:plant_shop/data/data.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/pages/plant_detail/plant_detail_page.dart';

import 'plant_widget.dart';

class Body extends StatelessWidget {
  final List<GroupPlant> plants;

  const Body({
    super.key,
    required this.plants,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8)
          .copyWith(top: 15, bottom: 30),
      itemCount: dataPlants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: .55,
      ),
      itemBuilder: (_, index) {
        GroupPlant plant = dataPlants[index];
        return PlantWidget(
          plant: plant,
          onPressed: () => _onPlantPressed(context, plant),
        );
      },
    );
  }

  // Functions
  _onPlantPressed(BuildContext context, GroupPlant groupPlant) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlantDetailPage(groupPlant: groupPlant),
      ),
    );
  }
}
