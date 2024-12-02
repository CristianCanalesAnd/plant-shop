import 'package:plant_shop/enums/pot_color.dart';
import 'package:plant_shop/enums/pot_type.dart';
import 'package:plant_shop/models/plant.dart';

class GroupPlant {
  final String name;
  final String description;
  final int rating;
  final Map<PotType, List<Pot>> pots;
  final bool isFavorite;

  Pot pot(PotType type) =>
      pots.containsKey(type) ? pots[type]!.first : pots[0]!.first;

  PotVariant potVariant(PotType type, PotColor color) {
    Pot p = pot(type);
    return p.variants.containsKey(color) ? p.variants[color]! : p.variants[0]!;
  }

  GroupPlant({
    required this.name,
    required this.description,
    required this.rating,
    required this.pots,
    required this.isFavorite,
  });

  Plant toPlant(PotType type, PotColor color) {
    Pot p = pot(type);
    return Plant(
      id: "${name}_${type.name}_${color.name}",
      name: name,
      description: description,
      potType: type,
      price: p.price,
      height: p.height,
      color: color,
      image: potVariant(type, color).image,
    );
  }

  GroupPlant copyWith({
    String? name,
    String? description,
    int? rating,
    Map<PotType, List<Pot>>? pots,
    bool? isFavorite,
  }) {
    return GroupPlant(
      name: name ?? this.name,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      pots: pots ?? this.pots,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class Pot {
  final int price;
  final String height;
  final Map<PotColor, PotVariant> variants;

  Pot({
    required this.height,
    required this.price,
    required this.variants,
  });
}

class PotVariant {
  final String image;

  PotVariant({
    required this.image,
  });
}
