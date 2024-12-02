import 'package:flutter/material.dart';

import 'account_custom_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            AccountCustomButton(
              title: "My Address",
              image: 'assets/images/common/location.png',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            AccountCustomButton(
              title: "Payment",
              image: 'assets/images/common/card.png',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            AccountCustomButton(
              title: "My Order",
              image: 'assets/images/common/orders.png',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            AccountCustomButton(
              title: "Settings",
              image: 'assets/images/common/settings.png',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            AccountCustomButton(
              title: "Help & Support",
              image: 'assets/images/common/support.png',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
