import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/plant_cart.dart';
import 'package:plant_shop/router/router.gr.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';

import 'shopping_cart_list.dart';
import 'shopping_cart_total.dart';

class ShoppingCartDetail extends StatelessWidget {
  final List<PlantCart> shopItems;

  const ShoppingCartDetail({
    super.key,
    required this.shopItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        int itemTotal = _calculateTotal(shopItems);

        return SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
            child: Column(
              children: [
                ShoppingCartList(shopItems: shopItems),
                ShoppingCartTotal(
                  itemTotal: itemTotal,
                  onProceedToCheckoutPressed: () => context.router.push(
                    CheckoutRoute(
                      shopItems: shopItems,
                      itemTotal: itemTotal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Functions
  int _calculateTotal(List<PlantCart> items) {
    return items.fold(
        0, (total, item) => total + (item.plant.price * item.quantity));
  }
}
