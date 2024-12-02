import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/plant.dart';
import 'package:plant_shop/models/plant_cart.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/widgets/quantity_controls.dart';

class PlantCartWidget extends StatefulWidget {
  final PlantCart plantCart;

  const PlantCartWidget({
    super.key,
    required this.plantCart,
  });

  @override
  State<PlantCartWidget> createState() => _PlantCartWidgetState();
}

class _PlantCartWidgetState extends State<PlantCartWidget> {
  Plant get plant => widget.plantCart.plant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          buildImage(),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: AppTextStyle.bold(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(
                  "Size: ${plant.height}",
                  style: AppTextStyle.regular(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "\$${plant.price}",
                  style: AppTextStyle.bold(fontSize: 20),
                ),
                const SizedBox(height: 20),
                buildQuantityContainer()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: 144,
      width: 144,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.white,
          width: 5,
        ),
        image: DecorationImage(
          image: AssetImage(
            plant.image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildQuantityContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QuantityControls(
          quantity: widget.plantCart.quantity,
          addItem: () => context.read<AppStateCubit>().increaseItem(plant),
          removeItem: () => context.read<AppStateCubit>().removeItem(plant),
        ),
        buildDeleteButton(),
      ],
    );
  }

  Widget buildDeleteButton() {
    double size = 25;

    return GestureDetector(
      onTap: () => context.read<AppStateCubit>().deleteItem(plant),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.red.withOpacity(.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          'assets/images/common/delete.png',
          height: size,
          width: size,
        ),
      ),
    );
  }
}
