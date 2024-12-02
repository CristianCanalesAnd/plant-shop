import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/router/router.gr.dart';
import 'package:plant_shop/widgets/nav_button.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Spacer(),
          NavButton(
            image: 'assets/images/common/notification.png',
            onTap: () => context.router.push(const NotificationsRoute()),
          ),
        ],
      ),
    );
  }
}
