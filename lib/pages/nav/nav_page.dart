import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/pages/nav/enums/nav_item.dart';
import 'package:plant_shop/router/router.gr.dart';
import 'package:plant_shop/theme/app_colors.dart';

@RoutePage()
class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeTab(),
        FavoriteTab(),
        ShoppingCartTab(),
        AccountTab(),
      ],
      bottomNavigationBuilder: buildBottomNavigation,
    );
  }

  Widget buildBottomNavigation(BuildContext context, TabsRouter tabsRouter) {
    return BottomNavigationBar(
      elevation: 10,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      selectedItemColor: AppColors.primary500,
      unselectedItemColor: AppColors.dark,
      type: BottomNavigationBarType.fixed,
      items: NavItem.values
          .map((e) => e.buildNavButton(tabsRouter.activeIndex))
          .toList(),
    );
  }
}
