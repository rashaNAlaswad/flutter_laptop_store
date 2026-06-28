import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/l10n_extensions.dart';
import 'package:get/get.dart';

import '../../cart/view/cart_view.dart';
import '../../favorites/view/favorites_view.dart';
import '../../home/view/home_view.dart';
import '../../settings/view/settings_view.dart';
import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex,
          children: const [
            HomeView(),
            FavoritesView(),
            CartView(),
            SettingsView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[800],
          onTap: controller.changeScreen,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: context.l10n.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: context.l10n.favorites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: context.l10n.cart,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: context.l10n.settings),
          ],
        ),
      ),
    );
  }
}
