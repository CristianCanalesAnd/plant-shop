import 'package:plant_shop/enums/pot_color.dart';
import 'package:plant_shop/enums/pot_type.dart';

class Plant {
  final String name;
  final String id;
  final String description;
  final PotType potType;
  final int price;
  final String height;
  final PotColor color;
  final String image;

  Plant({
    required this.id,
    required this.name,
    required this.description,
    required this.potType,
    required this.price,
    required this.height,
    required this.color,
    required this.image,
  });
}
