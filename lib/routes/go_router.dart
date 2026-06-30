import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/modules/base/view/base_view.dart';
import 'package:flutter_application_1/modules/cart/view/cart_view.dart';
import 'package:flutter_application_1/modules/details/view/details_view.dart';
import 'package:flutter_application_1/modules/favorites/view/favorites_view.dart';
import 'package:flutter_application_1/modules/home/view/home_view.dart';
import 'package:flutter_application_1/modules/onboarding/view/on_boarding_view.dart';
import 'package:flutter_application_1/modules/settings/view/settings_view.dart';
import 'package:flutter_application_1/modules/splash/view/splash_view.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: '${Routes.detail}/:id',
      builder: (context, state) =>
          DetailsView(laptopId: int.parse(state.pathParameters['id']!)),
    ),
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return BaseView(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.favorites,
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.cart,
              builder: (context, state) => const CartView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settings,
              builder: (context, state) => const SettingsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
