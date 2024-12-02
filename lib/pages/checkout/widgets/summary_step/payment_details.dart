import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

import '../../cubit/checkout_page_cubit.dart';

class PaymentAddress extends StatelessWidget {
  const PaymentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        final card = state.card;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: AppTextStyle.bold(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.dark.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    card.type.image,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    card.cardNumber,
                    style: AppTextStyle.regular(
                      color: AppColors.dark,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary5Percent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/common/edit.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
