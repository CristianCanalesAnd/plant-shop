import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/plant_cart.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'widgets/body.dart';

@RoutePage()
class CheckoutPage extends StatelessWidget {
  final List<PlantCart> shopItems;
  final int itemTotal;

  const CheckoutPage({
    super.key,
    required this.shopItems,
    required this.itemTotal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CheckoutPageCubit()..initialize(shopItems, itemTotal),
      child: BlocConsumer<CheckoutPageCubit, CheckoutPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: buildAppBar(),
            body: const Body(),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Checkout',
        style: AppTextStyle.bold(
          color: AppColors.dark,
          fontSize: 20,
        ),
      ),
    );
  }
}
