import 'package:flutter/material.dart';
import 'package:plant_shop/enums/pot_color.dart';
import 'package:plant_shop/enums/pot_type.dart';
import 'package:plant_shop/models/group_plant.dart';
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
  PotType type = PotType.meyer;
  PotColor potColor = PotColor.white;

  GroupPlant get plant => widget.plant;
  Pot get pot => plant.pot(type);
  PotVariant get potVariant => plant.potVariant(type, potColor);

  final double _imageSize = 180;

  @override
  void initState() {
    setState(() {
      type = plant.pots.keys.first;
      potColor = pot.variants.keys.first;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15)
            .copyWith(top: 15, bottom: 10),
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
    );
  }

  Widget buildImage() {
    return Container(
      height: _imageSize,
      width: _imageSize,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(potVariant.image),
          fit: BoxFit.fitWidth,
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
      "\$${pot.price}",
      style: AppTextStyle.bold(
        color: AppColors.dark,
        fontSize: 20,
      ),
    );
  }
}
