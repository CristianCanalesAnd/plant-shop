import 'package:flutter/material.dart';
import 'package:plant_shop/models/plant_cart.dart';
import 'package:plant_shop/pages/shopping_cart/widgets/plant_cart_widget.dart';

class ShoppingCartList extends StatelessWidget {
  final List<PlantCart> shopItems;

  const ShoppingCartList({
    super.key,
    required this.shopItems,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: shopItems.map((e) => PlantCartWidget(plantCart: e)).toList(),
      ),
    );
  }
}
