import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/data/data.dart';
import 'package:plant_shop/models/address.dart';
import 'package:plant_shop/models/card.dart';
import 'package:plant_shop/models/plant_cart.dart';
import 'package:plant_shop/pages/checkout/enums/checkout_progress_step.dart';

part 'checkout_page_state.dart';

class CheckoutPageCubit extends Cubit<CheckoutPageState> {
  CheckoutPageCubit() : super(CheckoutPageState.initial());

  initialize(List<PlantCart> shopItems, int itemTotal) {
    emit(state.copyWith(shopItems: shopItems, itemTotal: itemTotal));
  }

  onCheckoutProgressStepPressed(CheckoutProgressStep step) {
    emit(state.copyWith(step: step));
  }

  onCardPressed(Card card) {
    emit(state.copyWith(card: card));
  }

  onAddressPressed(Address address) {
    emit(state.copyWith(address: address));
  }
}
