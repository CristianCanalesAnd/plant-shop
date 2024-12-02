import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';
import 'package:plant_shop/pages/checkout/enums/checkout_progress_step.dart';

import 'address_step/address_step.dart';
import 'checkout_progress.dart';
import 'payment_step/payment_step.dart';
import 'summary_step/summary_step.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CheckoutProgress(),
                const SizedBox(height: 20),
                buildCheckoutStep(state.step),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCheckoutStep(CheckoutProgressStep step) {
    switch (step) {
      case CheckoutProgressStep.address:
        return const AddressStep();
      case CheckoutProgressStep.payment:
        return const PaymentStep();
      case CheckoutProgressStep.summary:
        return const SummaryStep();
    }
  }
}
