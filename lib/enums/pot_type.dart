enum PotType {
  meyer,
  round,
  circle,
  square,
  standing;

  String get localizedTitle {
    switch (this) {
      case PotType.meyer:
        return 'Meyer';
      case PotType.round:
        return 'Round';
      case PotType.circle:
        return 'Circle';
      case PotType.square:
        return 'Square';
      case PotType.standing:
        return 'Standing';
    }
  }
}
