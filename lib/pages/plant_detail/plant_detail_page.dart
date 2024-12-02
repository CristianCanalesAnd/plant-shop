import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/pages/shopping_cart/shopping_cart_page.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';

import 'widgets/body.dart';

@RoutePage()
class PlantDetailPage extends StatefulWidget {
  final GroupPlant groupPlant;

  const PlantDetailPage({
    super.key,
    required this.groupPlant,
  });

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  late GroupPlant groupPlant;

  @override
  void initState() {
    setState(() {
      groupPlant = widget.groupPlant;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(),
      body: Body(groupPlant: groupPlant),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        buildFavoriteButton(),
        const SizedBox(width: 20),
        buildShopButton(),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget buildFavoriteButton() {
    return buildActionButton(
      image: groupPlant.isFavorite
          ? 'assets/images/common/favorite.png'
          : 'assets/images/nav/unfavorite.png',
      onTap: _onFavoritePressed,
    );
  }

  Widget buildShopButton() {
    return buildActionButton(
      image: 'assets/images/nav/shopping-cart.png',
      color: AppColors.dark,
      onTap: _onShopPressed,
    );
  }

  Widget buildActionButton({
    required String image,
    required Function() onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        color: color,
        width: 35,
      ),
    );
  }

  //Functions
  _onFavoritePressed() {
    setState(() {
      groupPlant = groupPlant.copyWith(isFavorite: !groupPlant.isFavorite);
    });

    context.read<AppStateCubit>().updateFavorites(context, groupPlant);
  }

  _onShopPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ShoppingCartPage()),
    );
  }
}
