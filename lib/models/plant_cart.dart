import 'package:plant_shop/models/plant.dart';

class PlantCart {
  final Plant plant;
  final int quantity;

  PlantCart({
    required this.plant,
    required this.quantity,
  });

  PlantCart copyWith({
    Plant? plant,
    int? quantity,
  }) {
    return PlantCart(
      plant: plant ?? this.plant,
      quantity: quantity ?? this.quantity,
    );
  }
}
