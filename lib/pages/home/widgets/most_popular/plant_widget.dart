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

  final double _imageSize = 200;

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
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: _imageSize,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImage(),
              const SizedBox(height: 10),
              buildName(),
              buildDescription(),
              const SizedBox(height: 10),
              buildPrice(),
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

  Container buildImage() {
    return Container(
      height: _imageSize,
      width: _imageSize,
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
