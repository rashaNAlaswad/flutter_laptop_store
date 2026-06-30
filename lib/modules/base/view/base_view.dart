import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/l10n_extensions.dart';
import 'package:go_router/go_router.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[800],
        onTap: navigationShell.goBranch,
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
    );
  }
}
