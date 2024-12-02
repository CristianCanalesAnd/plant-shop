import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/data/data.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';

import 'card_widget.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        return Column(
          children: cards.map(
            (card) {
              bool isActive = card.id == state.card.id;

              return CardWidget(
                card: card,
                isActive: isActive,
                onPressed: () =>
                    context.read<CheckoutPageCubit>().onCardPressed(card),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
