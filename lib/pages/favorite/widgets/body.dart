import 'package:flutter/material.dart';
import 'package:plant_shop/models/group_plant.dart';

import 'plant_widget.dart';

class Body extends StatelessWidget {
  final List<GroupPlant> favorites;
  final Function(GroupPlant) onPlantPressed;

  const Body({
    super.key,
    required this.favorites,
    required this.onPlantPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Flexible(
              child: ListView(
                children: favorites
                    .map(
                      (groupPlant) => PlantWidget(
                        groupPlant: groupPlant,
                        onPressed: () => onPlantPressed(groupPlant),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
