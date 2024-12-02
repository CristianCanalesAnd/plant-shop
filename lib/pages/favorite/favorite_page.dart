import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/router/router.gr.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import 'widgets/body.dart';

@RoutePage(name: 'FavoriteTab')
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.gray10Percent,
          appBar: buildAppBar(),
          body: Body(
            favorites: state.favorites,
            onPlantPressed: _onPlantPressed,
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.gray10Percent,
      title: Text(
        'Favorites',
        style: AppTextStyle.bold(
          color: AppColors.dark,
          fontSize: 28,
        ),
      ),
      centerTitle: false,
    );
  }

  // Functions
  _onPlantPressed(GroupPlant groupPlant) {
    context.router.push(PlantDetailRoute(groupPlant: groupPlant));
  }
}
