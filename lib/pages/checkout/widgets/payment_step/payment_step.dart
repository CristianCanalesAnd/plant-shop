import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_text_style.dart';
import 'package:plant_shop/widgets/custom_button.dart';

import 'card_list.dart';

class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                buildTitle(),
                const SizedBox(height: 20),
                const CardList(),
              ],
            ),
          ),
          buildAddNewCard(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'Saved Cards',
      style: AppTextStyle.bold(fontSize: 18),
    );
  }

  Widget buildAddNewCard() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: '+ Add New Card',
        onPressed: () {},
      ),
    );
  }
}
