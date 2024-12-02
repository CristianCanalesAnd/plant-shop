import 'package:flutter/material.dart';
import 'package:plant_shop/enums/pot_color.dart';
import 'package:plant_shop/enums/pot_type.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/models/plant.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class PlantWidget extends StatefulWidget {
  final GroupPlant plant;
  final Function() onPressed;

  const PlantWidget({
    super.key,
    required this.plant,
    required this.onPressed,
  });

  @override
  State<PlantWidget> createState() => _PlantWidgetState();
}

class _PlantWidgetState extends State<PlantWidget> {
  GroupPlant get groupPlant => widget.plant;
  late Plant plant;

  double imageSize = 120;

  @override
  void initState() {
    PotType type = groupPlant.pots.keys.first;
    PotColor potColor = groupPlant.pot(type).variants.keys.first;
    plant = groupPlant.toPlant(type, potColor);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImage(),
              const SizedBox(width: 15),
              Flexible(
                child: SizedBox(
                  height: imageSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildName(),
                      const SizedBox(height: 10),
                      buildDescription(),
                      const Spacer(),
                      buildPrice(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName() {
    return Text(
      plant.name,
      style: AppTextStyle.bold(
        color: AppColors.dark,
        fontSize: 20,
      ),
      maxLines: 1,
    );
  }

  Widget buildDescription() {
    return Text(
      plant.description,
      style: AppTextStyle.regular(
        color: AppColors.gray,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 2,
    );
  }

  Widget buildPrice() {
    return Text(
      "\$${plant.price}",
      style: AppTextStyle.bold(
        color: AppColors.dark,
        fontSize: 20,
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: imageSize,
      width: imageSize,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(plant.image),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
