import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/data/data.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/models/plant.dart';
import 'package:plant_shop/models/plant_cart.dart';

part 'app_state_state.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit() : super(AppStateState.initial());

  updateFavorites(BuildContext context, GroupPlant groupPlant) {
    List<GroupPlant> groupPlants = List.of(state.groupPlants);
    int index = groupPlants.indexWhere((p) => p.name == groupPlant.name);
    groupPlants[index] = groupPlant;

    emit(state.copyWith(groupPlants: groupPlants));

    SnackBar snackBar = SnackBar(
      content: Text(
        groupPlant.isFavorite
            ? 'Item added to favorites'
            : 'Item removed from favorites',
      ),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void addItemToCart(BuildContext context, Plant plant, int quantity) {
    for (int i = 0; i < quantity; i++) {
      increaseItem(plant);
    }

    SnackBar snackBar = const SnackBar(
      content: Text('Added to cart'),
      duration: Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void increaseItem(Plant plant) {
    List<PlantCart> shopItemsCopy = List.of(state.shopItems);
    int index = shopItemsCopy.indexWhere((e) => e.plant.id == plant.id);

    if (index == -1) {
      shopItemsCopy.add(PlantCart(plant: plant, quantity: 1));
    } else {
      shopItemsCopy[index] = shopItemsCopy[index].copyWith(
        quantity: shopItemsCopy[index].quantity + 1,
      );
    }

    emit(state.copyWith(shopItems: shopItemsCopy));
  }

  void removeItem(Plant plant) {
    List<PlantCart> shopItemsCopy = List.of(state.shopItems);
    int index = shopItemsCopy.indexWhere((e) => e.plant.id == plant.id);

    PlantCart shopItemToDelete = shopItemsCopy[index];
    int quantity = shopItemToDelete.quantity - 1;

    if (quantity == 0) {
      shopItemsCopy.removeAt(index);
    } else {
      shopItemsCopy[index] = shopItemsCopy[index].copyWith(quantity: quantity);
    }

    emit(state.copyWith(shopItems: shopItemsCopy));
  }

  void deleteItem(Plant plant) {
    List<PlantCart> shopItemsCopy = List.of(state.shopItems);
    int index = shopItemsCopy.indexWhere((e) => e.plant.id == plant.id);

    shopItemsCopy.removeAt(index);

    emit(state.copyWith(shopItems: shopItemsCopy));
  }
}
