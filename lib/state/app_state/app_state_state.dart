part of 'app_state_cubit.dart';

class AppStateState extends Equatable {
  final List<GroupPlant> groupPlants;
  final List<PlantCart> shopItems;

  List<GroupPlant> get favorites =>
      groupPlants.where((p) => p.isFavorite).toList();

  const AppStateState({
    required this.groupPlants,
    required this.shopItems,
  });

  factory AppStateState.initial() {
    return AppStateState(
      groupPlants: dataPlants,
      shopItems: const [],
    );
  }

  AppStateState copyWith({
    List<GroupPlant>? groupPlants,
    List<PlantCart>? shopItems,
  }) {
    return AppStateState(
      groupPlants: groupPlants ?? this.groupPlants,
      shopItems: shopItems ?? this.shopItems,
    );
  }

  @override
  List<Object> get props => [groupPlants, shopItems];
}
