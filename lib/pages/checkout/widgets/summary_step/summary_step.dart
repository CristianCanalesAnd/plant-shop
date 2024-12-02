import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/custom_button.dart';

import 'delivery_address.dart';
import 'items_details.dart';
import 'order_summary.dart';
import 'payment_details.dart';

class SummaryStep extends StatelessWidget {
  const SummaryStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 30),
              children: const [
                ItemsDetail(),
                SizedBox(height: 20),
                DeliveryAddress(),
                SizedBox(height: 20),
                PaymentAddress(),
                SizedBox(height: 20),
                OrderSummary(),
              ],
            ),
          ),
          buildPayNow(context),
        ],
      ),
    );
  }

  Widget buildPayNow(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'Pay Now',
        onPressed: () => context.router.pop(),
      ),
    );
  }
}
