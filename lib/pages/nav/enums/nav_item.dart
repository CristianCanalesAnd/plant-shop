import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';

enum NavItem {
  home,
  favorite,
  shoppingCart,
  account;

  String get localizedTitle {
    switch (this) {
      case home:
        return 'Home';
      case favorite:
        return 'Favorite';
      case shoppingCart:
        return 'Cart';
      case account:
        return 'Account';
    }
  }

  BottomNavigationBarItem buildNavButton(int indexSelected) {
    bool isActive = index == indexSelected;

    return BottomNavigationBarItem(
      icon: _buildIcon(isActive),
      label: localizedTitle,
    );
  }

  Widget _buildIcon(bool isActive) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Image.asset(
          _image,
          color: isActive ? AppColors.primary500 : AppColors.dark,
          width: 24,
        ),
      ),
    );
  }

  String get _image {
    switch (this) {
      case home:
        return 'assets/images/nav/home.png';
      case favorite:
        return 'assets/images/nav/unfavorite.png';
      case shoppingCart:
        return 'assets/images/nav/shopping-cart.png';
      case account:
        return 'assets/images/nav/profile.png';
    }
  }
}
