// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:plant_shop/models/group_plant.dart' as _i18;
import 'package:plant_shop/models/plant_cart.dart' as _i17;
import 'package:plant_shop/pages/account/account_page.dart' as _i1;
import 'package:plant_shop/pages/checkout/checkout_page.dart' as _i2;
import 'package:plant_shop/pages/favorite/favorite_page.dart' as _i3;
import 'package:plant_shop/pages/forgot_password/forgot_password_page.dart'
    as _i4;
import 'package:plant_shop/pages/home/home_page.dart' as _i5;
import 'package:plant_shop/pages/login/login_page.dart' as _i6;
import 'package:plant_shop/pages/nav/nav_page.dart' as _i7;
import 'package:plant_shop/pages/notifications/notifications_page.dart' as _i8;
import 'package:plant_shop/pages/onboarding/onboarding_page.dart' as _i9;
import 'package:plant_shop/pages/plant_detail/plant_detail_page.dart' as _i10;
import 'package:plant_shop/pages/shopping_cart/shopping_cart_page.dart' as _i11;
import 'package:plant_shop/pages/show_all/show_all_page.dart' as _i12;
import 'package:plant_shop/pages/signup/signup_page.dart' as _i13;
import 'package:plant_shop/pages/splash_screen.dart' as _i14;

abstract class $RootRouter extends _i15.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AccountTab.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountPage(),
      );
    },
    CheckoutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CheckoutPage(
          key: args.key,
          shopItems: args.shopItems,
          itemTotal: args.itemTotal,
        ),
      );
    },
    FavoriteTab.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavoritePage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    LogInRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LogInPage(),
      );
    },
    NavRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NavPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NotificationsPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnboardingPage(),
      );
    },
    PlantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PlantDetailRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.PlantDetailPage(
          key: args.key,
          groupPlant: args.groupPlant,
        ),
      );
    },
    ShoppingCartTab.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ShoppingCartPage(),
      );
    },
    ShowAllRoute.name: (routeData) {
      final args = routeData.argsAs<ShowAllRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ShowAllPage(
          key: args.key,
          plants: args.plants,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountPage]
class AccountTab extends _i15.PageRouteInfo<void> {
  const AccountTab({List<_i15.PageRouteInfo>? children})
      : super(
          AccountTab.name,
          initialChildren: children,
        );

  static const String name = 'AccountTab';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CheckoutPage]
class CheckoutRoute extends _i15.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i16.Key? key,
    required List<_i17.PlantCart> shopItems,
    required int itemTotal,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CheckoutRoute.name,
          args: CheckoutRouteArgs(
            key: key,
            shopItems: shopItems,
            itemTotal: itemTotal,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i15.PageInfo<CheckoutRouteArgs> page =
      _i15.PageInfo<CheckoutRouteArgs>(name);
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    this.key,
    required this.shopItems,
    required this.itemTotal,
  });

  final _i16.Key? key;

  final List<_i17.PlantCart> shopItems;

  final int itemTotal;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, shopItems: $shopItems, itemTotal: $itemTotal}';
  }
}

/// generated route for
/// [_i3.FavoritePage]
class FavoriteTab extends _i15.PageRouteInfo<void> {
  const FavoriteTab({List<_i15.PageRouteInfo>? children})
      : super(
          FavoriteTab.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteTab';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeTab extends _i15.PageRouteInfo<void> {
  const HomeTab({List<_i15.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LogInPage]
class LogInRoute extends _i15.PageRouteInfo<void> {
  const LogInRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NavPage]
class NavRoute extends _i15.PageRouteInfo<void> {
  const NavRoute({List<_i15.PageRouteInfo>? children})
      : super(
          NavRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NotificationsPage]
class NotificationsRoute extends _i15.PageRouteInfo<void> {
  const NotificationsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnboardingPage]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PlantDetailPage]
class PlantDetailRoute extends _i15.PageRouteInfo<PlantDetailRouteArgs> {
  PlantDetailRoute({
    _i16.Key? key,
    required _i18.GroupPlant groupPlant,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PlantDetailRoute.name,
          args: PlantDetailRouteArgs(
            key: key,
            groupPlant: groupPlant,
          ),
          initialChildren: children,
        );

  static const String name = 'PlantDetailRoute';

  static const _i15.PageInfo<PlantDetailRouteArgs> page =
      _i15.PageInfo<PlantDetailRouteArgs>(name);
}

class PlantDetailRouteArgs {
  const PlantDetailRouteArgs({
    this.key,
    required this.groupPlant,
  });

  final _i16.Key? key;

  final _i18.GroupPlant groupPlant;

  @override
  String toString() {
    return 'PlantDetailRouteArgs{key: $key, groupPlant: $groupPlant}';
  }
}

/// generated route for
/// [_i11.ShoppingCartPage]
class ShoppingCartTab extends _i15.PageRouteInfo<void> {
  const ShoppingCartTab({List<_i15.PageRouteInfo>? children})
      : super(
          ShoppingCartTab.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingCartTab';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ShowAllPage]
class ShowAllRoute extends _i15.PageRouteInfo<ShowAllRouteArgs> {
  ShowAllRoute({
    _i16.Key? key,
    required List<_i18.GroupPlant> plants,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ShowAllRoute.name,
          args: ShowAllRouteArgs(
            key: key,
            plants: plants,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowAllRoute';

  static const _i15.PageInfo<ShowAllRouteArgs> page =
      _i15.PageInfo<ShowAllRouteArgs>(name);
}

class ShowAllRouteArgs {
  const ShowAllRouteArgs({
    this.key,
    required this.plants,
  });

  final _i16.Key? key;

  final List<_i18.GroupPlant> plants;

  @override
  String toString() {
    return 'ShowAllRouteArgs{key: $key, plants: $plants}';
  }
}

/// generated route for
/// [_i13.SignUpPage]
class SignUpRoute extends _i15.PageRouteInfo<void> {
  const SignUpRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
