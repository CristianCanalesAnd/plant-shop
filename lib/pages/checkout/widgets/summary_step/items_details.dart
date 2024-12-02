import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/plant.dart';
import 'package:plant_shop/models/plant_cart.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class ItemsDetail extends StatelessWidget {
  const ItemsDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        final shopItems = state.shopItems;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.dark.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final plantCart = shopItems[index];
                  return PlantCartWidget(plantCart: plantCart);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: shopItems.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildTitle() {
    return Text(
      'Item Details',
      style: AppTextStyle.bold(fontSize: 18),
    );
  }
}

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
  int get quantity => widget.plantCart.quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                "\$${plant.price}",
                style: AppTextStyle.regular(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "QTY: $quantity",
                style: AppTextStyle.regular(fontSize: 18),
              ),
            ],
          ),
        )
      ],
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
}
