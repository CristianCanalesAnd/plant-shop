enum CardType {
  visa,
  mastercard;

  String get image {
    switch (this) {
      case CardType.visa:
        return 'assets/images/card_type/visa.png';
      case CardType.mastercard:
        return 'assets/images/card_type/mastercard.png';
    }
  }
}

class Card {
  final int id;
  final String cardNumber;
  final CardType type;

  Card({
    required this.id,
    required this.cardNumber,
    required this.type,
  });
}
