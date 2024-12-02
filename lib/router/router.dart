import 'package:auto_route/auto_route.dart';
import 'package:plant_shop/router/router.gr.dart';

///if you want the generator to run one time and exits use: "dart run build_runner build --delete-conflicting-outputs"
@AutoRouterConfig(generateForDir: ['lib'])
class RootRouter extends $RootRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          path: '/splashscreen',
        ),
        CustomRoute(
          page: OnboardingRoute.page,
          path: '/onboarding',
        ),
        CustomRoute(
          page: LogInRoute.page,
          path: '/login',
        ),
        CustomRoute(
          page: SignUpRoute.page,
          path: '/signup',
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ForgotPasswordRoute.page,
          path: '/forgot_password',
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: '/nav',
          page: NavRoute.page,
          children: [
            CustomRoute(
              page: HomeTab.page,
              path: 'home',
            ),
            CustomRoute(
              page: FavoriteTab.page,
              path: 'favorites',
            ),
            CustomRoute(
              page: ShoppingCartTab.page,
              path: 'shopping_cart',
            ),
            CustomRoute(
              page: AccountTab.page,
              path: 'account',
            ),
          ],
        ),
        CustomRoute(
          page: PlantDetailRoute.page,
          path: '/plant_detail',
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ShowAllRoute.page,
          path: '/show_all',
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: NotificationsRoute.page,
          path: '/notifications',
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: CheckoutRoute.page,
          path: '/checkout',
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        RedirectRoute(path: '*', redirectTo: '/splashscreen'),
      ];
}
