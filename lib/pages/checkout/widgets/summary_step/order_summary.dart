import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/pages/checkout/cubit/checkout_page_cubit.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({
    super.key,
  });

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  double shippingCharge = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(),
        const SizedBox(height: 10),
        buildItemTotal(),
        const SizedBox(height: 10),
        buildShippingCharge(),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        buildGranTotal(),
      ],
    );
  }

  Widget buildTitle() {
    return Text(
      'Order Summary',
      style: AppTextStyle.bold(fontSize: 18),
    );
  }

  Widget buildItemTotal() {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Item Total',
              style: AppTextStyle.regular(
                color: AppColors.dark,
                fontSize: 18,
              ),
            ),
            Text(
              '\$${state.itemTotal}',
              style: AppTextStyle.regular(
                color: AppColors.dark,
                fontSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildShippingCharge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shipping Charge',
          style: AppTextStyle.regular(
            color: AppColors.dark,
            fontSize: 18,
          ),
        ),
        Text(
          '\$$shippingCharge',
          style: AppTextStyle.regular(
            color: AppColors.dark,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildGranTotal() {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        double total = state.itemTotal + shippingCharge;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Grand Total',
              style: AppTextStyle.bold(
                color: AppColors.dark,
                fontSize: 22,
              ),
            ),
            Text(
              '\$$total',
              style: AppTextStyle.bold(
                color: AppColors.dark,
                fontSize: 22,
              ),
            ),
          ],
        );
      },
    );
  }
}
