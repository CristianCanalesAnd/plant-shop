import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/pages/home/widgets/my_favorite/my_favorite.dart';
import 'package:plant_shop/router/router.gr.dart';

import 'custom_search_bar.dart';
import 'filtered_plants/filtered_plants.dart';
import 'home_nav.dart';
import 'most_popular/most_popular.dart';
import 'welcome_label.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _searchController = TextEditingController();
  String seachName = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          paddingWrapped(const HomeNav()),
          paddingWrapped(const WelcomeLabel()),
          const SizedBox(height: 20),
          paddingWrapped(
            CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearchNameChanged,
            ),
          ),
          const SizedBox(height: 35),
          Flexible(
            child: seachName.isEmpty
                ? buildMostPopularAndFavorites()
                : buildFilteredPlants(),
          ),
        ],
      ),
    );
  }

  Widget buildFilteredPlants() {
    return FilteredPlants(
      searchName: seachName,
      onPlantPressed: _onPlantPressed,
    );
  }

  Widget buildMostPopularAndFavorites() {
    return ListView(
      children: [
        MostPopular(
          onViewAllPressed: _onViewAllPressed,
          onPlantPressed: _onPlantPressed,
        ),
        const SizedBox(height: 35),
        paddingWrapped(
          MyFavorite(
            onViewAllPressed: _onViewAllPressed,
            onPlantPressed: _onPlantPressed,
          ),
        ),
      ],
    );
  }

  Widget paddingWrapped(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Functions
  _onPlantPressed(GroupPlant groupPlant) {
    context.router.push(PlantDetailRoute(groupPlant: groupPlant));
  }

  _onViewAllPressed(List<GroupPlant> plants) {
    context.router.push(ShowAllRoute(plants: plants));
  }

  _onSearchNameChanged(String value) {
    setState(() {
      seachName = value;
    });
  }
}
