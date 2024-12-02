import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/plant_cart.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';

import 'shopping_cart_detail.dart';
import 'shopping_cart_empty.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        List<PlantCart> shopItems = state.shopItems;

        if (shopItems.isEmpty) {
          return const ShoppingCartEmpty();
        }

        return ShoppingCartDetail(shopItems: shopItems);
      },
    );
  }
}
