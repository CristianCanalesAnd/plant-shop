part of 'checkout_page_cubit.dart';

class CheckoutPageState extends Equatable {
  final CheckoutProgressStep step;
  final Address address;
  final Card card;
  final List<PlantCart> shopItems;
  final int itemTotal;

  const CheckoutPageState({
    required this.step,
    required this.address,
    required this.card,
    required this.shopItems,
    required this.itemTotal,
  });

  factory CheckoutPageState.initial() {
    return CheckoutPageState(
      step: CheckoutProgressStep.address,
      address: listAddress.first,
      card: cards.first,
      shopItems: const [],
      itemTotal: 0,
    );
  }

  CheckoutPageState copyWith({
    CheckoutProgressStep? step,
    Address? address,
    Card? card,
    List<PlantCart>? shopItems,
    int? itemTotal,
  }) {
    return CheckoutPageState(
      step: step ?? this.step,
      address: address ?? this.address,
      card: card ?? this.card,
      shopItems: shopItems ?? this.shopItems,
      itemTotal: itemTotal ?? this.itemTotal,
    );
  }

  @override
  List<Object> get props => [step, address, card, shopItems, itemTotal];
}
